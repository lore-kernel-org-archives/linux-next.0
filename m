From: Alexis Berlemont <alexis.berlemont@gmail.com>
Subject: linux-next: comedi: Range_table and range_table_list
Date: Sun, 26 Apr 2009 23:47:51 +0200
Message-ID: <87skjvf5o8.fsf@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:52051 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751929AbZDZVrz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Apr 2009 17:47:55 -0400
Received: by fxm2 with SMTP id 2so1987609fxm.37
        for <linux-next@vger.kernel.org>; Sun, 26 Apr 2009 14:47:53 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: greg@kroah.com

--=-=-=

Hi,

Please, find attached two patches related with the Comedi layer.

Each patch is a proposal to change the way the ranges tables are managed
within the subdevice structure. 

As you may know, the range structure allows the translation of freshly
acquired logical values into real values (thanks to the unit, the
minimal and the maximal value)

An acquisition subdevice can work with various ranges. That is why
some tab field is necessary to hold them all in the subdevice
descriptor structure. However, what I do not understand is why are
there two fields to handle them (and we cannot use both at the same
time).

Currently, according to the ranges' type: 
- either same ranges for all channels
- or a specific ranges table per channel,
we have to use the field range_table or the field range_table_list.

The range management could be made easier or at least more generic:
- the first proposal introduces a container structure. Thanks to its
  first field, we could define the range's type for a specific
  subdevice; and the second field is devoted to store comedi_lrange
  pointers. Some inline helper functions were added so as to manage
  the range without having to get through the structures.
- the second patch is the closest one from the original API. An internal
  structure is added (comedi_trange_struct) so as to handle per channel
  ranges tables. The internal range management code just has to detect
  which structure type is hidden behind the subdevice field range_table.

These patches are neither that clean nor perfect, they are just some
ideas I would like to share. By the way, these patches modify only the
core files (kcomedilib and the drivers have been left unchanged).

Best regards.

Alexis. 



--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-Introduce-a-container-structure-for-ranges-so-as-to.patch
Content-Description: Proposal 1

>From 12b57a9ece86c658fc84db4c635d69d2f7e9638f Mon Sep 17 00:00:00 2001
From: Alexis Berlemont <alexis.berlemont@gmail.com>
Date: Sun, 26 Apr 2009 00:51:43 +0200
Subject: [PATCH] Introduce a container structure for ranges so as to handle global
 range tables and per channel range tables

---
 drivers/staging/comedi/comedi_fops.c |   11 +++--
 drivers/staging/comedi/comedidev.h   |   75 +++++++++++++++++++++++++++++++++-
 drivers/staging/comedi/drivers.c     |    5 +-
 drivers/staging/comedi/range.c       |   64 +++++++++++------------------
 4 files changed, 107 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index bb4a289..c71ddf6 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -419,7 +419,7 @@ static int do_subdinfo_ioctl(struct comedi_device *dev, struct comedi_subdinfo *
 		us->maxdata = s->maxdata;
 		if (s->range_table) {
 			us->range_type =
-			    (i << 24) | (0 << 16) | (s->range_table->length);
+			    (i << 24) | (0 << 16) | get_range_table(s, 0)->length;
 		} else {
 			us->range_type = 0;	/* XXX */
 		}
@@ -437,7 +437,8 @@ static int do_subdinfo_ioctl(struct comedi_device *dev, struct comedi_subdinfo *
 			us->subd_flags |= SDF_MAXDATA;
 		if (s->flaglist)
 			us->subd_flags |= SDF_FLAGS;
-		if (s->range_table_list)
+		if (s->range_table && 
+		    (s->range_table->mode & COMEDI_PERCHAN_LRANGE) != 0)
 			us->subd_flags |= SDF_RANGETYPE;
 		if (s->do_cmd)
 			us->subd_flags |= SDF_CMD;
@@ -503,13 +504,15 @@ static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_chaninfo *
 	if (it.rangelist) {
 		int i;
 
-		if (!s->range_table_list)
+ 		if(s->range_table == NULL ||
+ 		   (s->range_table->mode & COMEDI_PERCHAN_LRANGE) == 0)
 			return -EINVAL;
+
 		for (i = 0; i < s->n_chan; i++) {
 			int x;
 
 			x = (dev->minor << 28) | (it.subdev << 24) | (i << 16) |
-			    (s->range_table_list[i]->length);
+				get_range_table(s, i)->length;
 			put_user(x, it.rangelist + i);
 		}
 #if 0
diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
index 753d3ab..4c67058 100644
--- a/drivers/staging/comedi/comedidev.h
+++ b/drivers/staging/comedi/comedidev.h
@@ -149,8 +149,7 @@ struct comedi_subdevice {
 
 	unsigned int settling_time_0;
 
-	const struct comedi_lrange *range_table;
-	const struct comedi_lrange *const *range_table_list;
+	struct comedi_crange *range_table;
 
 	unsigned int *chanlist;	/* driver-owned chanlist (not used) */
 
@@ -411,6 +410,78 @@ struct comedi_lrange {
 	struct comedi_krange range[GCC_ZERO_LENGTH_ARRAY];
 };
 
+#define COMEDI_PERCHAN_LRANGE	0x80000000
+
+struct comedi_crange {
+	unsigned int mode;
+	struct comedi_lrange *list[0];
+};
+
+/* For static configuration (global declaration) */
+#define COMEDI_GLOBAL_RNG(x) {			\
+	.mode = 0,				\
+	.list = {&(x)}, }
+
+/* For dynamic confiugration */
+static inline int setup_global_range_table(struct comedi_subdevice * subd,
+					   struct comedi_lrange *lrng)
+{
+	subd->range_table = kmalloc(sizeof(struct comedi_crange) +
+				    sizeof(struct comedi_lrange *), 
+				    GFP_KERNEL);
+
+	if(subd->range_table == NULL)
+		return -ENOMEM;
+
+	subd->range_table->mode = 0;
+	subd->range_table->list[0] = lrng;
+	
+	return 0;
+}
+
+static inline int alloc_perchan_range_table(struct comedi_subdevice * subd)
+{
+	subd->range_table = kmalloc(sizeof(struct comedi_crange) +
+				    sizeof(struct comedi_lrange *) * 
+				    subd->n_chan, 
+				    GFP_KERNEL);
+
+	if(subd->range_table == NULL)
+		return -ENOMEM;
+
+	memset(subd->range_table, 0,
+	       sizeof(struct comedi_crange) +
+	       sizeof(struct comedi_lrange *) * subd->n_chan);
+	
+	subd->range_table->mode = COMEDI_PERCHAN_LRANGE;
+	
+	return 0;
+}
+
+static inline int set_range_table(struct comedi_subdevice *subd,
+				  unsigned int chan_idx,
+				  struct comedi_lrange *lrng)
+{
+	if(subd->range_table == NULL)
+		return -EINVAL;
+
+	chan_idx = (subd->range_table->mode & COMEDI_PERCHAN_LRANGE) ?
+		chan_idx : 0;
+	subd->range_table->list[chan_idx] = lrng;
+
+	return 0;
+}
+
+static inline 
+struct comedi_lrange *get_range_table(struct comedi_subdevice *subd,
+				      unsigned int chan_idx)
+{
+	chan_idx = (subd->range_table->mode & COMEDI_PERCHAN_LRANGE) ?
+		chan_idx : 0;
+	return subd->range_table->list[chan_idx];
+}
+				  
+
 /* some silly little inline functions */
 
 static inline int alloc_subdevices(struct comedi_device *dev,
diff --git a/drivers/staging/comedi/drivers.c b/drivers/staging/comedi/drivers.c
index cabbf09..c0bcff3 100644
--- a/drivers/staging/comedi/drivers.c
+++ b/drivers/staging/comedi/drivers.c
@@ -273,8 +273,9 @@ static int postconfig(struct comedi_device *dev)
 			comedi_alloc_subdevice_minor(dev, s);
 		}
 
-		if (!s->range_table && !s->range_table_list)
-			s->range_table = &range_unknown;
+		if (!s->range_table)
+			setup_global_range_table
+				(s, (struct comedi_lrange *)&range_unknown);
 
 		if (!s->insn_read && s->insn_bits)
 			s->insn_read = insn_rw_emulate_bits;
diff --git a/drivers/staging/comedi/range.c b/drivers/staging/comedi/range.c
index d09f0bb..04f7b89 100644
--- a/drivers/staging/comedi/range.c
+++ b/drivers/staging/comedi/range.c
@@ -61,15 +61,11 @@ int do_rangeinfo_ioctl(struct comedi_device *dev, struct comedi_rangeinfo *arg)
 	if (subd >= dev->n_subdevices)
 		return -EINVAL;
 	s = dev->subdevices + subd;
-	if (s->range_table) {
-		lr = s->range_table;
-	} else if (s->range_table_list) {
-		if (chan >= s->n_chan)
-			return -EINVAL;
-		lr = s->range_table_list[chan];
-	} else {
-		return -EINVAL;
-	}
+
+ 	if (s->range_table == NULL || chan >= s->n_chan)
+ 		return -EINVAL;
+ 	else
+ 		lr = get_range_table(s, chan);
 
 	if (RANGE_LENGTH(it.range_type) != lr->length) {
 		DPRINTK("wrong length %d should be %d (0x%08x)\n",
@@ -125,36 +121,24 @@ int check_chanlist(struct comedi_subdevice *s, int n, unsigned int *chanlist)
 	int i;
 	int chan;
 
-	if (s->range_table) {
-		for (i = 0; i < n; i++)
-			if (CR_CHAN(chanlist[i]) >= s->n_chan ||
-				CR_RANGE(chanlist[i]) >= s->range_table->length
-				|| aref_invalid(s, chanlist[i])) {
-				rt_printk
-					("bad chanlist[%d]=0x%08x n_chan=%d range length=%d\n",
-					i, chanlist[i], s->n_chan,
-					s->range_table->length);
-#if 0
-				for (i = 0; i < n; i++)
-					printk("[%d]=0x%08x\n", i, chanlist[i]);
-#endif
-				return -EINVAL;
-			}
-	} else if (s->range_table_list) {
-		for (i = 0; i < n; i++) {
-			chan = CR_CHAN(chanlist[i]);
-			if (chan >= s->n_chan ||
-				CR_RANGE(chanlist[i]) >=
-				s->range_table_list[chan]->length
-				|| aref_invalid(s, chanlist[i])) {
-				rt_printk("bad chanlist[%d]=0x%08x\n", i,
-					chanlist[i]);
-				return -EINVAL;
-			}
-		}
-	} else {
-		rt_printk("comedi: (bug) no range type list!\n");
-		return -EINVAL;
-	}
+ 	if (s->range_table == NULL) {
+  		rt_printk("comedi: (bug) no range type list!\n");
+  		return -EINVAL;
+  	}
+ 	
+ 	for (i = 0; i < n; i++) {
+ 
+ 		chan = CR_CHAN(chanlist[i]);
+ 
+ 		if (chan >= s->n_chan ||
+ 		    CR_RANGE(chanlist[i]) >= get_range_table(s, chan)->length || 
+ 		    aref_invalid(s, chanlist[i])) {
+ 			
+ 			rt_printk("bad chanlist[%d]=0x%08x\n", 
+ 				  i, chanlist[i]);
+ 			return -EINVAL;
+ 		}
+ 	}
+
 	return 0;
 }
-- 
1.6.2.4


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0001-Add-an-internal-structure-to-handle-per-channel-rang.patch
Content-Description: Proposal 2

>From 56980bc984730de6aaa65e14e595a2c8c34f3781 Mon Sep 17 00:00:00 2001
From: Alexis Berlemont <alexis.berlemont@gmail.com>
Date: Sun, 26 Apr 2009 15:50:05 +0200
Subject: [PATCH] Add an internal structure to handle per channel ranges tables.

---
 drivers/staging/comedi/comedi_fops.c |   18 ++++++++---
 drivers/staging/comedi/comedidev.h   |   26 ++++++++++++++++-
 drivers/staging/comedi/drivers.c     |    2 +-
 drivers/staging/comedi/range.c       |   53 ++++++++++++++++++++-------------
 4 files changed, 71 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index bb4a289..0b9c8e9 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -419,7 +419,8 @@ static int do_subdinfo_ioctl(struct comedi_device *dev, struct comedi_subdinfo *
 		us->maxdata = s->maxdata;
 		if (s->range_table) {
 			us->range_type =
-			    (i << 24) | (0 << 16) | (s->range_table->length);
+			    (i << 24) | (0 << 16) | 
+			    (s->range_table->length & ~COMEDI_PERCHAN_LRANGE);
 		} else {
 			us->range_type = 0;	/* XXX */
 		}
@@ -437,7 +438,8 @@ static int do_subdinfo_ioctl(struct comedi_device *dev, struct comedi_subdinfo *
 			us->subd_flags |= SDF_MAXDATA;
 		if (s->flaglist)
 			us->subd_flags |= SDF_FLAGS;
-		if (s->range_table_list)
+		if (s->range_table && 
+		    (s->range_table->length & COMEDI_PERCHAN_LRANGE) != 0)
 			us->subd_flags |= SDF_RANGETYPE;
 		if (s->do_cmd)
 			us->subd_flags |= SDF_CMD;
@@ -503,13 +505,19 @@ static int do_chaninfo_ioctl(struct comedi_device *dev, struct comedi_chaninfo *
 	if (it.rangelist) {
 		int i;
 
-		if (!s->range_table_list)
-			return -EINVAL;
+ 		struct comedi_trange *trng;
+  
+ 		if(s->range_table == NULL ||
+ 		   (s->range_table->length & COMEDI_PERCHAN_LRANGE) == 0)
+  			return -EINVAL;
+ 
+ 		trng = (struct comedi_trange *) s->range_table;
+ 
 		for (i = 0; i < s->n_chan; i++) {
 			int x;
 
 			x = (dev->minor << 28) | (it.subdev << 24) | (i << 16) |
-			    (s->range_table_list[i]->length);
+			    (trng->list[i]->length & ~COMEDI_PERCHAN_LRANGE);
 			put_user(x, it.rangelist + i);
 		}
 #if 0
diff --git a/drivers/staging/comedi/comedidev.h b/drivers/staging/comedi/comedidev.h
index 753d3ab..cc70048 100644
--- a/drivers/staging/comedi/comedidev.h
+++ b/drivers/staging/comedi/comedidev.h
@@ -150,7 +150,6 @@ struct comedi_subdevice {
 	unsigned int settling_time_0;
 
 	const struct comedi_lrange *range_table;
-	const struct comedi_lrange *const *range_table_list;
 
 	unsigned int *chanlist;	/* driver-owned chanlist (not used) */
 
@@ -406,11 +405,18 @@ extern const struct comedi_lrange range_unknown;
 #define GCC_ZERO_LENGTH_ARRAY 0
 #endif
 
+#define COMEDI_PERCHAN_LRANGE	0x80000000
+
 struct comedi_lrange {
 	int length;
 	struct comedi_krange range[GCC_ZERO_LENGTH_ARRAY];
 };
 
+ struct comedi_trange {
+ 	int length;
+ 	struct comedi_lrange *list[0];
+ };
+
 /* some silly little inline functions */
 
 static inline int alloc_subdevices(struct comedi_device *dev,
@@ -440,6 +446,24 @@ static inline int alloc_private(struct comedi_device *dev, int size)
 	return 0;
 }
 
+static inline int alloc_range_table_list(struct comedi_subdevice * subd)
+{
+	struct comedi_trange * trng = 
+		kmalloc(sizeof(struct comedi_trange) + 
+			subd->n_chan * sizeof(struct comedi_lrange *),
+			GFP_KERNEL);
+	
+	if (trng == NULL)
+		return -ENOMEM;
+
+	memset(trng, 0, sizeof(struct comedi_trange) + 
+	       subd->n_chan * sizeof(struct comedi_lrange *));
+
+	trng->length = COMEDI_PERCHAN_LRANGE | subd->n_chan;
+	
+	return 0;
+}
+
 static inline unsigned int bytes_per_sample(const struct comedi_subdevice *subd)
 {
 	if (subd->subdev_flags & SDF_LSAMPL)
diff --git a/drivers/staging/comedi/drivers.c b/drivers/staging/comedi/drivers.c
index cabbf09..f368548 100644
--- a/drivers/staging/comedi/drivers.c
+++ b/drivers/staging/comedi/drivers.c
@@ -273,7 +273,7 @@ static int postconfig(struct comedi_device *dev)
 			comedi_alloc_subdevice_minor(dev, s);
 		}
 
-		if (!s->range_table && !s->range_table_list)
+		if (!s->range_table)
 			s->range_table = &range_unknown;
 
 		if (!s->insn_read && s->insn_bits)
diff --git a/drivers/staging/comedi/range.c b/drivers/staging/comedi/range.c
index d09f0bb..1953c25 100644
--- a/drivers/staging/comedi/range.c
+++ b/drivers/staging/comedi/range.c
@@ -61,14 +61,19 @@ int do_rangeinfo_ioctl(struct comedi_device *dev, struct comedi_rangeinfo *arg)
 	if (subd >= dev->n_subdevices)
 		return -EINVAL;
 	s = dev->subdevices + subd;
-	if (s->range_table) {
-		lr = s->range_table;
-	} else if (s->range_table_list) {
+
+ 	if (s->range_table == NULL) {
+ 		return -EINVAL;
+ 	} else if (s->range_table->length & COMEDI_PERCHAN_LRANGE) {
+ 		struct comedi_trange *trng;
+
 		if (chan >= s->n_chan)
 			return -EINVAL;
-		lr = s->range_table_list[chan];
+
+ 		trng = (struct comedi_trange *) s->range_table;
+ 		lr = trng->list[chan];
 	} else {
-		return -EINVAL;
+		lr = s->range_table;
 	}
 
 	if (RANGE_LENGTH(it.range_type) != lr->length) {
@@ -125,7 +130,27 @@ int check_chanlist(struct comedi_subdevice *s, int n, unsigned int *chanlist)
 	int i;
 	int chan;
 
-	if (s->range_table) {
+	if (s->range_table == NULL) {
+		rt_printk("comedi: (bug) no range type list!\n");
+		return -EINVAL;
+	}
+
+	if (s->range_table->length & COMEDI_PERCHAN_LRANGE) {
+		struct comedi_trange *trng = 
+			(struct comedi_trange *) s->range_table;
+
+		for (i = 0; i < n; i++) {
+			chan = CR_CHAN(chanlist[i]);
+			if (chan >= s->n_chan ||
+				CR_RANGE(chanlist[i]) >=
+				trng->list[chan]->length
+				|| aref_invalid(s, chanlist[i])) {
+				rt_printk("bad chanlist[%d]=0x%08x\n", i,
+					chanlist[i]);
+				return -EINVAL;
+			}
+		}
+	} else {
 		for (i = 0; i < n; i++)
 			if (CR_CHAN(chanlist[i]) >= s->n_chan ||
 				CR_RANGE(chanlist[i]) >= s->range_table->length
@@ -140,21 +165,7 @@ int check_chanlist(struct comedi_subdevice *s, int n, unsigned int *chanlist)
 #endif
 				return -EINVAL;
 			}
-	} else if (s->range_table_list) {
-		for (i = 0; i < n; i++) {
-			chan = CR_CHAN(chanlist[i]);
-			if (chan >= s->n_chan ||
-				CR_RANGE(chanlist[i]) >=
-				s->range_table_list[chan]->length
-				|| aref_invalid(s, chanlist[i])) {
-				rt_printk("bad chanlist[%d]=0x%08x\n", i,
-					chanlist[i]);
-				return -EINVAL;
-			}
-		}
-	} else {
-		rt_printk("comedi: (bug) no range type list!\n");
-		return -EINVAL;
 	}
+
 	return 0;
 }
-- 
1.6.2.4


--=-=-=--

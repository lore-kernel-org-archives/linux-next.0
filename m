From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 9/9] pcmcia: remove pcmcia_get_{first,next}_tuple()
Date: Thu, 29 Oct 2009 01:02:50 +0100
Message-ID: <20091029000250.GA27418@comet.dominikbrodowski.net>
References: <1255907255-28297-4-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-5-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-6-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-7-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-8-git-send-email-linux@dominikbrodowski.net> <1255907255-28297-9-git-send-email-linux@dominikbrodowski.net> <20091026151958.a2e7871b.randy.dunlap@oracle.com> <20091027051224.GA10891@isilmar.linta.de> <20091027143923.GA17627@suse.de> <20091028212700.GB31361@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:37608 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755503AbZJ2ACw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 20:02:52 -0400
Content-Disposition: inline
In-Reply-To: <20091028212700.GB31361@comet.dominikbrodowski.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, linux-pcmcia@lists.infradead.org

On Wed, Oct 28, 2009 at 10:27:00PM +0100, Dominik Brodowski wrote:
> On Tue, Oct 27, 2009 at 07:39:23AM -0700, Greg KH wrote:
> > On Tue, Oct 27, 2009 at 06:12:24AM +0100, Dominik Brodowski wrote:
> > > Randy,
> > > 
> > > On Mon, Oct 26, 2009 at 03:19:58PM -0700, Randy Dunlap wrote:
> > > > > Remove the pcmcia_get_{first,next}_tuple() calls no longer needed by
> > > > > (current) pcmcia device drivers.
> > > > 
> > > > linux-next 20091026:
> > > > 
> > > > drivers/staging/comedi/drivers/cb_das16_cs.c:155: error: implicit declaration of function 'pcmcia_get_first_tuple'
> > > > drivers/staging/comedi/drivers/cb_das16_cs.c:156: error: implicit declaration of function 'pcmcia_get_tuple_data'
> > > > drivers/staging/comedi/drivers/cb_das16_cs.c:883: error: implicit declaration of function 'pcmcia_get_next_tuple'
> > > > 
> > > > There are also other comedi/ drivers that this randconfig didn't attempt
> > > > to build that are still using these same interfaces.
> > > 
> > > What are the current rules on drivers in staging/ ? Do they need to be
> > > updated as well on API changes?
> > 
> > You don't have to do it, no.  I'll be glad to do so as long as I get a
> > hint as to what needs to be done :)
> 
> These hints are in Documentation/pcmcia/driver-changes.txt . However, I'll
> try to get some patches cooked up myself tonight for those drivers. Whom
> shall I submit them to, or shall I just add them to the PCMCIA tree?

Update all changes (already those not included in linux-next) which are in
the queue for 2.6.33 for all comedi PCMCIA drivers. Compile-tested only, and
I'll queue it up with the other PCMCIA patches.


From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Thu, 29 Oct 2009 00:54:49 +0100
Subject: [PATCH 1/1] pcmcia/staging: update comedi drivers

Update comedi PCMCIA drivers to work with recent PCMCIA changes documented
in Documentation/pcmcia/driver-changes.txt:

- use pcmcia_config_loop()
- don't use PCMCIA_DEBUG, but use dev_dbg()
- don't use cs_error()
- re-use prod_id and card_id values already stored

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/staging/comedi/drivers/cb_das16_cs.c     |  220 +++++---------------
 drivers/staging/comedi/drivers/das08_cs.c        |  202 +++++--------------
 drivers/staging/comedi/drivers/ni_daq_700.c      |  236 +++++++---------------
 drivers/staging/comedi/drivers/ni_daq_dio24.c    |  235 +++++++---------------
 drivers/staging/comedi/drivers/ni_labpc_cs.c     |  224 +++++++--------------
 drivers/staging/comedi/drivers/ni_mio_cs.c       |  127 +++---------
 drivers/staging/comedi/drivers/quatech_daqp_cs.c |  215 +++++---------------
 7 files changed, 424 insertions(+), 1035 deletions(-)

diff --git a/drivers/staging/comedi/drivers/cb_das16_cs.c b/drivers/staging/comedi/drivers/cb_das16_cs.c
index 80c0df8..9e75802 100644
--- a/drivers/staging/comedi/drivers/cb_das16_cs.c
+++ b/drivers/staging/comedi/drivers/cb_das16_cs.c
@@ -141,37 +141,14 @@ static int das16cs_timer_insn_config(struct comedi_device *dev,
 				     struct comedi_insn *insn,
 				     unsigned int *data);
 
-static int get_prodid(struct comedi_device *dev, struct pcmcia_device *link)
-{
-	tuple_t tuple;
-	u_short buf[128];
-	int prodid = 0;
-
-	tuple.TupleData = (cisdata_t *) buf;
-	tuple.TupleOffset = 0;
-	tuple.TupleDataMax = 255;
-	tuple.DesiredTuple = CISTPL_MANFID;
-	tuple.Attributes = TUPLE_RETURN_COMMON;
-	if ((pcmcia_get_first_tuple(link, &tuple) == 0) &&
-	    (pcmcia_get_tuple_data(link, &tuple) == 0)) {
-		prodid = le16_to_cpu(buf[1]);
-	}
-
-	return prodid;
-}
-
 static const struct das16cs_board *das16cs_probe(struct comedi_device *dev,
 						 struct pcmcia_device *link)
 {
-	int id;
 	int i;
 
-	id = get_prodid(dev, link);
-
 	for (i = 0; i < n_boards; i++) {
-		if (das16cs_boards[i].device_id == id) {
+		if (das16cs_boards[i].device_id == link->card_id)
 			return das16cs_boards + i;
-		}
 	}
 
 	printk("unknown board!\n");
@@ -660,27 +637,8 @@ static int das16cs_timer_insn_config(struct comedi_device *dev,
 
 ======================================================================*/
 
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
 #if defined(CONFIG_PCMCIA) || defined(CONFIG_PCMCIA_MODULE)
 
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static char *version =
-    "cb_das16_cs.c pcmcia code (David Schleef), modified from dummy_cs.c 1.31 2001/08/24 12:13:13 (David Hinds)";
-#else
-#define DEBUG(n, args...)
-#endif
-
-/*====================================================================*/
-
 static void das16cs_pcmcia_config(struct pcmcia_device *link);
 static void das16cs_pcmcia_release(struct pcmcia_device *link);
 static int das16cs_pcmcia_suspend(struct pcmcia_device *p_dev);
@@ -733,7 +691,7 @@ static int das16cs_pcmcia_attach(struct pcmcia_device *link)
 {
 	struct local_info_t *local;
 
-	DEBUG(0, "das16cs_pcmcia_attach()\n");
+	dev_dbg(&link->dev, "das16cs_pcmcia_attach()\n");
 
 	/* Allocate space for private device-specific data */
 	local = kzalloc(sizeof(struct local_info_t), GFP_KERNEL);
@@ -760,7 +718,7 @@ static int das16cs_pcmcia_attach(struct pcmcia_device *link)
 
 static void das16cs_pcmcia_detach(struct pcmcia_device *link)
 {
-	DEBUG(0, "das16cs_pcmcia_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "das16cs_pcmcia_detach\n");
 
 	if (link->dev_node) {
 		((struct local_info_t *)link->priv)->stop = 1;
@@ -771,118 +729,55 @@ static void das16cs_pcmcia_detach(struct pcmcia_device *link)
 		kfree(link->priv);
 }				/* das16cs_pcmcia_detach */
 
-static void das16cs_pcmcia_config(struct pcmcia_device *link)
-{
-	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_fn, last_ret;
-	u_char buf[64];
-	cistpl_cftable_entry_t dflt = { 0 };
 
-	DEBUG(0, "das16cs_pcmcia_config(0x%p)\n", link);
-
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-
-	last_fn = GetFirstTuple;
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret != 0)
-		goto cs_failed;
-
-	last_fn = GetTupleData;
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret != 0)
-		goto cs_failed;
-
-	last_fn = ParseTuple;
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret != 0)
-		goto cs_failed;
-
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
+static int das16cs_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
+{
+	if (cfg->index == 0)
+		return -EINVAL;
 
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	last_fn = GetFirstTuple;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret)
-		goto cs_failed;
-
-	while (1) {
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-		if (pcmcia_get_tuple_data(link, &tuple))
-			goto next_entry;
-		if (pcmcia_parse_tuple(&tuple, &parse))
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Does this card need audio output? */
-/*	if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
-		link->conf.Attributes |= CONF_ENABLE_SPKR;
-		link->conf.Status = CCSR_AUDIO_ENA;
-	}
-*/
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-			if (!(io->flags & CISTPL_IO_8BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-			if (!(io->flags & CISTPL_IO_16BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-			/* This reserves IO space but doesn't actually enable it */
-			if (pcmcia_request_io(link, &link->io))
-				goto next_entry;
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
 		}
+		/* This reserves IO space but doesn't actually enable it */
+		return pcmcia_request_io(p_dev, &p_dev->io);
+	}
 
-		/* If we got this far, we're cool! */
-		break;
+	return 0;
+}
+
+static void das16cs_pcmcia_config(struct pcmcia_device *link)
+{
+	struct local_info_t *dev = link->priv;
+	int ret;
 
-next_entry:
-		last_fn = GetNextTuple;
+	dev_dbg(&link->dev, "das16cs_pcmcia_config\n");
 
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret)
-			goto cs_failed;
+	ret = pcmcia_loop_config(link, das16cs_pcmcia_config_loop, NULL);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	/*
@@ -891,21 +786,18 @@ next_entry:
 	   irq structure is initialized.
 	 */
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_fn = RequestIRQ;
-
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret)
-			goto cs_failed;
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 	/*
 	   This actually configures the PCMCIA socket -- setting up
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_fn = RequestConfiguration;
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret)
-		goto cs_failed;
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -930,14 +822,13 @@ next_entry:
 
 	return;
 
-cs_failed:
-	cs_error(link, last_fn, last_ret);
+failed:
 	das16cs_pcmcia_release(link);
 }				/* das16cs_pcmcia_config */
 
 static void das16cs_pcmcia_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "das16cs_pcmcia_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "das16cs_pcmcia_release\n");
 	pcmcia_disable_device(link);
 }				/* das16cs_pcmcia_release */
 
@@ -983,14 +874,13 @@ struct pcmcia_driver das16cs_driver = {
 
 static int __init init_das16cs_pcmcia_cs(void)
 {
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&das16cs_driver);
 	return 0;
 }
 
 static void __exit exit_das16cs_pcmcia_cs(void)
 {
-	DEBUG(0, "das16cs_pcmcia_cs: unloading\n");
+	pr_debug("das16cs_pcmcia_cs: unloading\n");
 	pcmcia_unregister_driver(&das16cs_driver);
 }
 
diff --git a/drivers/staging/comedi/drivers/das08_cs.c b/drivers/staging/comedi/drivers/das08_cs.c
index 9cab21e..384a77a 100644
--- a/drivers/staging/comedi/drivers/das08_cs.c
+++ b/drivers/staging/comedi/drivers/das08_cs.c
@@ -110,25 +110,6 @@ static int das08_cs_attach(struct comedi_device *dev,
 
 ======================================================================*/
 
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
-
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static const char *version =
-    "das08.c pcmcia code (Frank Hess), modified from dummy_cs.c 1.31 2001/08/24 12:13:13 (David Hinds)";
-#else
-#define DEBUG(n, args...)
-#endif
-
-/*====================================================================*/
 static void das08_pcmcia_config(struct pcmcia_device *link);
 static void das08_pcmcia_release(struct pcmcia_device *link);
 static int das08_pcmcia_suspend(struct pcmcia_device *p_dev);
@@ -181,7 +162,7 @@ static int das08_pcmcia_attach(struct pcmcia_device *link)
 {
 	struct local_info_t *local;
 
-	DEBUG(0, "das08_pcmcia_attach()\n");
+	dev_dbg(&link->dev, "das08_pcmcia_attach()\n");
 
 	/* Allocate space for private device-specific data */
 	local = kzalloc(sizeof(struct local_info_t), GFP_KERNEL);
@@ -224,7 +205,7 @@ static int das08_pcmcia_attach(struct pcmcia_device *link)
 static void das08_pcmcia_detach(struct pcmcia_device *link)
 {
 
-	DEBUG(0, "das08_pcmcia_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "das08_pcmcia_detach\n");
 
 	if (link->dev_node) {
 		((struct local_info_t *)link->priv)->stop = 1;
@@ -237,6 +218,44 @@ static void das08_pcmcia_detach(struct pcmcia_device *link)
 
 }				/* das08_pcmcia_detach */
 
+
+static int das08_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
+{
+	if (cfg->index == 0)
+		return -ENODEV;
+
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
+		}
+		/* This reserves IO space but doesn't actually enable it */
+		return pcmcia_request_io(p_dev, &p_dev->io);
+	}
+	return 0;
+}
+
+
 /*======================================================================
 
     das08_pcmcia_config() is scheduled to run after a CARD_INSERTION event
@@ -248,128 +267,20 @@ static void das08_pcmcia_detach(struct pcmcia_device *link)
 static void das08_pcmcia_config(struct pcmcia_device *link)
 {
 	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_fn, last_ret;
-	u_char buf[64];
-	cistpl_cftable_entry_t dflt = { 0 };
-
-	DEBUG(0, "das08_pcmcia_config(0x%p)\n", link);
-
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-	last_fn = GetFirstTuple;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret)
-		goto cs_failed;
-
-	last_fn = GetTupleData;
-
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret)
-		goto cs_failed;
-
-	last_fn = ParseTuple;
-
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret)
-		goto cs_failed;
-
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
-
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	last_fn = GetFirstTuple;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret)
-		goto cs_failed;
-
-	while (1) {
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-
-		last_ret = pcmcia_get_tuple_data(link, &tuple);
-		if (last_ret)
-			goto next_entry;
-
-		last_ret = pcmcia_parse_tuple(&tuple, &parse);
-		if (last_ret)
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Does this card need audio output? */
-/*	if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
-		link->conf.Attributes |= CONF_ENABLE_SPKR;
-		link->conf.Status = CCSR_AUDIO_ENA;
-	}
-*/
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-			if (!(io->flags & CISTPL_IO_8BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-			if (!(io->flags & CISTPL_IO_16BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-			/* This reserves IO space but doesn't actually enable it */
-			if (pcmcia_request_io(link, &link->io) != 0)
-				goto next_entry;
-		}
-
-		/* If we got this far, we're cool! */
-		break;
+	int ret;
 
-next_entry:
-		last_fn = GetNextTuple;
+	dev_dbg(&link->dev, "das08_pcmcia_config\n");
 
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret)
-			goto cs_failed;
+	ret = pcmcia_loop_config(link, das08_pcmcia_config_loop, NULL);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_fn = RequestIRQ;
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret)
-			goto cs_failed;
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 
 	/*
@@ -377,10 +288,9 @@ next_entry:
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_fn = RequestConfiguration;
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret)
-		goto cs_failed;
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -405,8 +315,7 @@ next_entry:
 
 	return;
 
-cs_failed:
-	cs_error(link, last_fn, last_ret);
+failed:
 	das08_pcmcia_release(link);
 
 }				/* das08_pcmcia_config */
@@ -421,7 +330,7 @@ cs_failed:
 
 static void das08_pcmcia_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "das08_pcmcia_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "das08_pcmcia_release\n");
 	pcmcia_disable_device(link);
 }				/* das08_pcmcia_release */
 
@@ -477,14 +386,13 @@ struct pcmcia_driver das08_cs_driver = {
 
 static int __init init_das08_pcmcia_cs(void)
 {
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&das08_cs_driver);
 	return 0;
 }
 
 static void __exit exit_das08_pcmcia_cs(void)
 {
-	DEBUG(0, "das08_pcmcia_cs: unloading\n");
+	pr_debug("das08_pcmcia_cs: unloading\n");
 	pcmcia_unregister_driver(&das08_cs_driver);
 }
 
diff --git a/drivers/staging/comedi/drivers/ni_daq_700.c b/drivers/staging/comedi/drivers/ni_daq_700.c
index ec31a39..e06d5b2 100644
--- a/drivers/staging/comedi/drivers/ni_daq_700.c
+++ b/drivers/staging/comedi/drivers/ni_daq_700.c
@@ -436,25 +436,7 @@ static int dio700_detach(struct comedi_device *dev)
 	return 0;
 };
 
-/* PCMCIA crap */
-
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static char *version = "ni_daq_700.c, based on dummy_cs.c";
-#else
-#define DEBUG(n, args...)
-#endif
-
-/*====================================================================*/
+/* PCMCIA crap -- watch your words, please! */
 
 static void dio700_config(struct pcmcia_device *link);
 static void dio700_release(struct pcmcia_device *link);
@@ -510,7 +492,7 @@ static int dio700_cs_attach(struct pcmcia_device *link)
 
 	printk(KERN_INFO "ni_daq_700:  cs-attach\n");
 
-	DEBUG(0, "dio700_cs_attach()\n");
+	dev_dbg(&link->dev, "dio700_cs_attach()\n");
 
 	/* Allocate space for private device-specific data */
 	local = kzalloc(sizeof(struct local_info_t), GFP_KERNEL);
@@ -555,7 +537,7 @@ static void dio700_cs_detach(struct pcmcia_device *link)
 
 	printk(KERN_INFO "ni_daq_700: cs-detach!\n");
 
-	DEBUG(0, "dio700_cs_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "dio700_cs_detach\n");
 
 	if (link->dev_node) {
 		((struct local_info_t *)link->priv)->stop = 1;
@@ -576,141 +558,85 @@ static void dio700_cs_detach(struct pcmcia_device *link)
 
 ======================================================================*/
 
-static void dio700_config(struct pcmcia_device *link)
+static int dio700_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
 {
-	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_ret;
-	u_char buf[64];
-	win_req_t req;
+	win_req_t *req = priv_data;
 	memreq_t map;
-	cistpl_cftable_entry_t dflt = { 0 };
 
-	printk(KERN_INFO "ni_daq_700:  cs-config\n");
-
-	DEBUG(0, "dio700_config(0x%p)\n", link);
+	if (cfg->index == 0)
+		return -ENODEV;
 
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
+	/* Does this card need audio output? */
+	if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
+		p_dev->conf.Attributes |= CONF_ENABLE_SPKR;
+		p_dev->conf.Status = CCSR_AUDIO_ENA;
 	}
 
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetTupleData, last_ret);
-		goto cs_failed;
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
+		}
+		/* This reserves IO space but doesn't actually enable it */
+		if (pcmcia_request_io(p_dev, &p_dev->io) != 0)
+			return -ENODEV;
 	}
 
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret) {
-		cs_error(link, ParseTuple, last_ret);
-		goto cs_failed;
+	if ((cfg->mem.nwin > 0) || (dflt->mem.nwin > 0)) {
+		cistpl_mem_t *mem =
+			(cfg->mem.nwin) ? &cfg->mem : &dflt->mem;
+		req->Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
+		req->Attributes |= WIN_ENABLE;
+		req->Base = mem->win[0].host_addr;
+		req->Size = mem->win[0].len;
+		if (req->Size < 0x1000)
+			req->Size = 0x1000;
+		req->AccessSpeed = 0;
+		if (pcmcia_request_window(&p_dev, req, &p_dev->win))
+			return -ENODEV;
+		map.Page = 0;
+		map.CardOffset = mem->win[0].card_addr;
+		if (pcmcia_map_mem_page(p_dev->win, &map))
+			return -ENODEV;
 	}
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
-
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret != 0) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
-	}
-	while (1) {
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-		if (pcmcia_get_tuple_data(link, &tuple) != 0)
-			goto next_entry;
-		if (pcmcia_parse_tuple(&tuple, &parse) != 0)
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Does this card need audio output? */
-		if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
-			link->conf.Attributes |= CONF_ENABLE_SPKR;
-			link->conf.Status = CCSR_AUDIO_ENA;
-		}
+	/* If we got this far, we're cool! */
+	return 0;
+}
 
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-			if (!(io->flags & CISTPL_IO_8BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-			if (!(io->flags & CISTPL_IO_16BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-			/* This reserves IO space but doesn't actually enable it */
-			if (pcmcia_request_io(link, &link->io) != 0)
-				goto next_entry;
-		}
+static void dio700_config(struct pcmcia_device *link)
+{
+	struct local_info_t *dev = link->priv;
+	win_req_t req;
+	int ret;
 
-		if ((cfg->mem.nwin > 0) || (dflt.mem.nwin > 0)) {
-			cistpl_mem_t *mem =
-			    (cfg->mem.nwin) ? &cfg->mem : &dflt.mem;
-			req.Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
-			req.Attributes |= WIN_ENABLE;
-			req.Base = mem->win[0].host_addr;
-			req.Size = mem->win[0].len;
-			if (req.Size < 0x1000)
-				req.Size = 0x1000;
-			req.AccessSpeed = 0;
-			if (pcmcia_request_window(&link, &req, &link->win))
-				goto next_entry;
-			map.Page = 0;
-			map.CardOffset = mem->win[0].card_addr;
-			if (pcmcia_map_mem_page(link->win, &map))
-				goto next_entry;
-		}
-		/* If we got this far, we're cool! */
-		break;
+	printk(KERN_INFO "ni_daq_700:  cs-config\n");
 
-next_entry:
+	dev_dbg(&link->dev, "dio700_config\n");
 
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret) {
-			cs_error(link, GetNextTuple, last_ret);
-			goto cs_failed;
-		}
+	ret = pcmcia_loop_config(link, dio700_pcmcia_config_loop, &req);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	/*
@@ -719,11 +645,9 @@ next_entry:
 	   irq structure is initialized.
 	 */
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret) {
-			cs_error(link, RequestIRQ, last_ret);
-			goto cs_failed;
-		}
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 
 	/*
@@ -731,11 +655,9 @@ next_entry:
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret != 0) {
-		cs_error(link, RequestConfiguration, last_ret);
-		goto cs_failed;
-	}
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret != 0)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -763,7 +685,7 @@ next_entry:
 
 	return;
 
-cs_failed:
+failed:
 	printk(KERN_INFO "ni_daq_700 cs failed");
 	dio700_release(link);
 
@@ -771,7 +693,7 @@ cs_failed:
 
 static void dio700_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "dio700_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "dio700_release\n");
 
 	pcmcia_disable_device(link);
 }				/* dio700_release */
@@ -830,15 +752,13 @@ struct pcmcia_driver dio700_cs_driver = {
 
 static int __init init_dio700_cs(void)
 {
-	printk("ni_daq_700:  cs-init \n");
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&dio700_cs_driver);
 	return 0;
 }
 
 static void __exit exit_dio700_cs(void)
 {
-	DEBUG(0, "ni_daq_700: unloading\n");
+	pr_debug("ni_daq_700: unloading\n");
 	pcmcia_unregister_driver(&dio700_cs_driver);
 }
 
diff --git a/drivers/staging/comedi/drivers/ni_daq_dio24.c b/drivers/staging/comedi/drivers/ni_daq_dio24.c
index 0700a8b..9257a42 100644
--- a/drivers/staging/comedi/drivers/ni_daq_dio24.c
+++ b/drivers/staging/comedi/drivers/ni_daq_dio24.c
@@ -187,25 +187,7 @@ static int dio24_detach(struct comedi_device *dev)
 	return 0;
 };
 
-/* PCMCIA crap */
-
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static char *version = "ni_daq_dio24.c, based on dummy_cs.c";
-#else
-#define DEBUG(n, args...)
-#endif
-
-/*====================================================================*/
+/* PCMCIA crap -- watch your words! */
 
 static void dio24_config(struct pcmcia_device *link);
 static void dio24_release(struct pcmcia_device *link);
@@ -261,7 +243,7 @@ static int dio24_cs_attach(struct pcmcia_device *link)
 
 	printk(KERN_INFO "ni_daq_dio24: HOLA SOY YO - CS-attach!\n");
 
-	DEBUG(0, "dio24_cs_attach()\n");
+	dev_dbg(&link->dev, "dio24_cs_attach()\n");
 
 	/* Allocate space for private device-specific data */
 	local = kzalloc(sizeof(struct local_info_t), GFP_KERNEL);
@@ -306,7 +288,7 @@ static void dio24_cs_detach(struct pcmcia_device *link)
 
 	printk(KERN_INFO "ni_daq_dio24: HOLA SOY YO - cs-detach!\n");
 
-	DEBUG(0, "dio24_cs_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "dio24_cs_detach\n");
 
 	if (link->dev_node) {
 		((struct local_info_t *)link->priv)->stop = 1;
@@ -327,142 +309,85 @@ static void dio24_cs_detach(struct pcmcia_device *link)
 
 ======================================================================*/
 
-static void dio24_config(struct pcmcia_device *link)
+static int dio24_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
 {
-	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_ret;
-	u_char buf[64];
-	win_req_t req;
+	win_req_t *req = priv_data;
 	memreq_t map;
-	cistpl_cftable_entry_t dflt = { 0 };
 
-	printk(KERN_INFO "ni_daq_dio24: HOLA SOY YO! - config\n");
-
-	DEBUG(0, "dio24_config(0x%p)\n", link);
-
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
-	}
+	if (cfg->index == 0)
+		return -ENODEV;
 
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetTupleData, last_ret);
-		goto cs_failed;
+	/* Does this card need audio output? */
+	if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
+		p_dev->conf.Attributes |= CONF_ENABLE_SPKR;
+		p_dev->conf.Status = CCSR_AUDIO_ENA;
 	}
 
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret) {
-		cs_error(link, ParseTuple, last_ret);
-		goto cs_failed;
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
+		}
+		/* This reserves IO space but doesn't actually enable it */
+		if (pcmcia_request_io(p_dev, &p_dev->io) != 0)
+			return -ENODEV;
 	}
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
-
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
 
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
+	if ((cfg->mem.nwin > 0) || (dflt->mem.nwin > 0)) {
+		cistpl_mem_t *mem =
+			(cfg->mem.nwin) ? &cfg->mem : &dflt->mem;
+		req->Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
+		req->Attributes |= WIN_ENABLE;
+		req->Base = mem->win[0].host_addr;
+		req->Size = mem->win[0].len;
+		if (req->Size < 0x1000)
+			req->Size = 0x1000;
+		req->AccessSpeed = 0;
+		if (pcmcia_request_window(&p_dev, req, &p_dev->win))
+			return -ENODEV;
+		map.Page = 0;
+		map.CardOffset = mem->win[0].card_addr;
+		if (pcmcia_map_mem_page(p_dev->win, &map))
+			return -ENODEV;
 	}
-	while (1) {
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-		if (pcmcia_get_tuple_data(link, &tuple) != 0)
-			goto next_entry;
-		if (pcmcia_parse_tuple(&tuple, &parse) != 0)
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Does this card need audio output? */
-		if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
-			link->conf.Attributes |= CONF_ENABLE_SPKR;
-			link->conf.Status = CCSR_AUDIO_ENA;
-		}
+	/* If we got this far, we're cool! */
+	return 0;
+}
 
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-			if (!(io->flags & CISTPL_IO_8BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-			if (!(io->flags & CISTPL_IO_16BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-			/* This reserves IO space but doesn't actually enable it */
-			if (pcmcia_request_io(link, &link->io) != 0)
-				goto next_entry;
-		}
+static void dio24_config(struct pcmcia_device *link)
+{
+	struct local_info_t *dev = link->priv;
+	int ret;
+	win_req_t req;
 
-		if ((cfg->mem.nwin > 0) || (dflt.mem.nwin > 0)) {
-			cistpl_mem_t *mem =
-			    (cfg->mem.nwin) ? &cfg->mem : &dflt.mem;
-			req.Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
-			req.Attributes |= WIN_ENABLE;
-			req.Base = mem->win[0].host_addr;
-			req.Size = mem->win[0].len;
-			if (req.Size < 0x1000)
-				req.Size = 0x1000;
-			req.AccessSpeed = 0;
-			if (pcmcia_request_window(&link, &req, &link->win))
-				goto next_entry;
-			map.Page = 0;
-			map.CardOffset = mem->win[0].card_addr;
-			if (pcmcia_map_mem_page(link->win, &map))
-				goto next_entry;
-		}
-		/* If we got this far, we're cool! */
-		break;
+	printk(KERN_INFO "ni_daq_dio24: HOLA SOY YO! - config\n");
 
-next_entry:
+	dev_dbg(&link->dev, "dio24_config\n");
 
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret) {
-			cs_error(link, GetNextTuple, last_ret);
-			goto cs_failed;
-		}
+	ret = pcmcia_loop_config(link, dio24_pcmcia_config_loop, &req);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	/*
@@ -471,11 +396,9 @@ next_entry:
 	   irq structure is initialized.
 	 */
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret) {
-			cs_error(link, RequestIRQ, last_ret);
-			goto cs_failed;
-		}
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 
 	/*
@@ -483,11 +406,9 @@ next_entry:
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret) {
-		cs_error(link, RequestConfiguration, last_ret);
-		goto cs_failed;
-	}
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -515,7 +436,7 @@ next_entry:
 
 	return;
 
-cs_failed:
+failed:
 	printk(KERN_INFO "Fallo");
 	dio24_release(link);
 
@@ -523,7 +444,7 @@ cs_failed:
 
 static void dio24_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "dio24_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "dio24_release\n");
 
 	pcmcia_disable_device(link);
 }				/* dio24_release */
@@ -582,14 +503,12 @@ struct pcmcia_driver dio24_cs_driver = {
 static int __init init_dio24_cs(void)
 {
 	printk("ni_daq_dio24: HOLA SOY YO!\n");
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&dio24_cs_driver);
 	return 0;
 }
 
 static void __exit exit_dio24_cs(void)
 {
-	DEBUG(0, "ni_dio24: unloading\n");
 	pcmcia_unregister_driver(&dio24_cs_driver);
 }
 
diff --git a/drivers/staging/comedi/drivers/ni_labpc_cs.c b/drivers/staging/comedi/drivers/ni_labpc_cs.c
index a3053b8..28ff4a6 100644
--- a/drivers/staging/comedi/drivers/ni_labpc_cs.c
+++ b/drivers/staging/comedi/drivers/ni_labpc_cs.c
@@ -153,23 +153,6 @@ static int labpc_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	return labpc_common_attach(dev, iobase, irq, 0);
 }
 
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static const char *version =
-    "ni_labpc.c, based on dummy_cs.c 1.31 2001/08/24 12:13:13";
-#else
-#define DEBUG(n, args...)
-#endif
-
 /*====================================================================*/
 
 /*
@@ -236,7 +219,7 @@ static int labpc_cs_attach(struct pcmcia_device *link)
 {
 	struct local_info_t *local;
 
-	DEBUG(0, "labpc_cs_attach()\n");
+	dev_dbg(&link->dev, "labpc_cs_attach()\n");
 
 	/* Allocate space for private device-specific data */
 	local = kzalloc(sizeof(struct local_info_t), GFP_KERNEL);
@@ -278,7 +261,7 @@ static int labpc_cs_attach(struct pcmcia_device *link)
 
 static void labpc_cs_detach(struct pcmcia_device *link)
 {
-	DEBUG(0, "labpc_cs_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "labpc_cs_detach\n");
 
 	/*
 	   If the device is currently configured and active, we won't
@@ -305,135 +288,84 @@ static void labpc_cs_detach(struct pcmcia_device *link)
 
 ======================================================================*/
 
-static void labpc_config(struct pcmcia_device *link)
+static int labpc_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
 {
-	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_ret;
-	u_char buf[64];
-	win_req_t req;
+	win_req_t *req = priv_data;
 	memreq_t map;
-	cistpl_cftable_entry_t dflt = { 0 };
 
-	DEBUG(0, "labpc_config(0x%p)\n", link);
+	if (cfg->index == 0)
+		return -ENODEV;
 
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
+	/* Does this card need audio output? */
+	if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
+		p_dev->conf.Attributes |= CONF_ENABLE_SPKR;
+		p_dev->conf.Status = CCSR_AUDIO_ENA;
 	}
 
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetTupleData, last_ret);
-		goto cs_failed;
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
+		}
+		/* This reserves IO space but doesn't actually enable it */
+		if (pcmcia_request_io(p_dev, &p_dev->io) != 0)
+			return -ENODEV;
 	}
 
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret) {
-		cs_error(link, ParseTuple, last_ret);
-		goto cs_failed;
+	if ((cfg->mem.nwin > 0) || (dflt->mem.nwin > 0)) {
+		cistpl_mem_t *mem =
+			(cfg->mem.nwin) ? &cfg->mem : &dflt->mem;
+		req->Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
+		req->Attributes |= WIN_ENABLE;
+		req->Base = mem->win[0].host_addr;
+		req->Size = mem->win[0].len;
+		if (req->Size < 0x1000)
+			req->Size = 0x1000;
+		req->AccessSpeed = 0;
+		if (pcmcia_request_window(&p_dev, req, &p_dev->win))
+			return -ENODEV;
+		map.Page = 0;
+		map.CardOffset = mem->win[0].card_addr;
+		if (pcmcia_map_mem_page(p_dev->win, &map))
+			return -ENODEV;
 	}
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
+	/* If we got this far, we're cool! */
+	return 0;
+}
 
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
-	}
-	while (1) {
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-		if (pcmcia_get_tuple_data(link, &tuple))
-			goto next_entry;
-		if (pcmcia_parse_tuple(&tuple, &parse))
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Does this card need audio output? */
-		if (cfg->flags & CISTPL_CFTABLE_AUDIO) {
-			link->conf.Attributes |= CONF_ENABLE_SPKR;
-			link->conf.Status = CCSR_AUDIO_ENA;
-		}
 
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-			/* This reserves IO space but doesn't actually enable it */
-			if (pcmcia_request_io(link, &link->io))
-				goto next_entry;
-		}
+static void labpc_config(struct pcmcia_device *link)
+{
+	struct local_info_t *dev = link->priv;
+	int ret;
+	win_req_t req;
 
-		if ((cfg->mem.nwin > 0) || (dflt.mem.nwin > 0)) {
-			cistpl_mem_t *mem =
-			    (cfg->mem.nwin) ? &cfg->mem : &dflt.mem;
-			req.Attributes = WIN_DATA_WIDTH_16 | WIN_MEMORY_TYPE_CM;
-			req.Attributes |= WIN_ENABLE;
-			req.Base = mem->win[0].host_addr;
-			req.Size = mem->win[0].len;
-			if (req.Size < 0x1000)
-				req.Size = 0x1000;
-			req.AccessSpeed = 0;
-			link->win = (window_handle_t) link;
-			if (pcmcia_request_window(&link, &req, &link->win))
-				goto next_entry;
-			map.Page = 0;
-			map.CardOffset = mem->win[0].card_addr;
-			if (pcmcia_map_mem_page(link->win, &map))
-				goto next_entry;
-		}
-		/* If we got this far, we're cool! */
-		break;
+	dev_dbg(&link->dev, "labpc_config\n");
 
-next_entry:
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret) {
-			cs_error(link, GetNextTuple, last_ret);
-			goto cs_failed;
-		}
+	ret = pcmcia_loop_config(link, labpc_pcmcia_config_loop, &req);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	/*
@@ -442,11 +374,9 @@ next_entry:
 	   irq structure is initialized.
 	 */
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret) {
-			cs_error(link, RequestIRQ, last_ret);
-			goto cs_failed;
-		}
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 
 	/*
@@ -454,11 +384,9 @@ next_entry:
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret) {
-		cs_error(link, RequestConfiguration, last_ret);
-		goto cs_failed;
-	}
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -486,14 +414,14 @@ next_entry:
 
 	return;
 
-cs_failed:
+failed:
 	labpc_release(link);
 
 }				/* labpc_config */
 
 static void labpc_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "labpc_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "labpc_release\n");
 
 	pcmcia_disable_device(link);
 }				/* labpc_release */
@@ -551,14 +479,12 @@ struct pcmcia_driver labpc_cs_driver = {
 
 static int __init init_labpc_cs(void)
 {
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&labpc_cs_driver);
 	return 0;
 }
 
 static void __exit exit_labpc_cs(void)
 {
-	DEBUG(0, "ni_labpc: unloading\n");
 	pcmcia_unregister_driver(&labpc_cs_driver);
 }
 
diff --git a/drivers/staging/comedi/drivers/ni_mio_cs.c b/drivers/staging/comedi/drivers/ni_mio_cs.c
index 9aef87f..ca7ab4a 100644
--- a/drivers/staging/comedi/drivers/ni_mio_cs.c
+++ b/drivers/staging/comedi/drivers/ni_mio_cs.c
@@ -312,96 +312,50 @@ static int mio_cs_resume(struct pcmcia_device *link)
 	return 0;
 }
 
-static void mio_cs_config(struct pcmcia_device *link)
-{
-	tuple_t tuple;
-	u_short buf[128];
-	cisparse_t parse;
-	int manfid = 0, prodid = 0;
-	int ret;
 
-	DPRINTK("mio_cs_config(link=%p)\n", link);
-
-	tuple.TupleData = (cisdata_t *) buf;
-	tuple.TupleOffset = 0;
-	tuple.TupleDataMax = 255;
-	tuple.Attributes = 0;
+static int mio_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
+{
+	int base, ret;
 
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	ret = pcmcia_get_first_tuple(link, &tuple);
-	ret = pcmcia_get_tuple_data(link, &tuple);
-	ret = pcmcia_parse_tuple(&tuple, &parse);
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
+	p_dev->io.NumPorts1 = cfg->io.win[0].len;
+	p_dev->io.IOAddrLines = cfg->io.flags & CISTPL_IO_LINES_MASK;
+	p_dev->io.NumPorts2 = 0;
 
-#if 0
-	tuple.DesiredTuple = CISTPL_LONGLINK_MFC;
-	tuple.Attributes = TUPLE_RETURN_COMMON | TUPLE_RETURN_LINK;
-	info->multi(first_tuple(link, &tuple, &parse) == 0);
-#endif
+	p_dev->irq.IRQInfo1 = cfg->irq.IRQInfo1;
+	p_dev->irq.IRQInfo2 = cfg->irq.IRQInfo2;
 
-	tuple.DesiredTuple = CISTPL_MANFID;
-	tuple.Attributes = TUPLE_RETURN_COMMON;
-	if ((pcmcia_get_first_tuple(link, &tuple) == 0) &&
-	    (pcmcia_get_tuple_data(link, &tuple) == 0)) {
-		manfid = le16_to_cpu(buf[0]);
-		prodid = le16_to_cpu(buf[1]);
+	for (base = 0x000; base < 0x400; base += 0x20) {
+		p_dev->io.BasePort1 = base;
+		ret = pcmcia_request_io(p_dev, &p_dev->io);
+		if (!ret)
+			return 0;
 	}
-	/* printk("manfid = 0x%04x, 0x%04x\n",manfid,prodid); */
+	return -ENODEV;
+}
 
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	tuple.Attributes = 0;
-	ret = pcmcia_get_first_tuple(link, &tuple);
-	ret = pcmcia_get_tuple_data(link, &tuple);
-	ret = pcmcia_parse_tuple(&tuple, &parse);
 
-#if 0
-	printk(" index: 0x%x\n", parse.cftable_entry.index);
-	printk(" flags: 0x%x\n", parse.cftable_entry.flags);
-	printk(" io flags: 0x%x\n", parse.cftable_entry.io.flags);
-	printk(" io nwin: 0x%x\n", parse.cftable_entry.io.nwin);
-	printk(" io base: 0x%x\n", parse.cftable_entry.io.win[0].base);
-	printk(" io len: 0x%x\n", parse.cftable_entry.io.win[0].len);
-	printk(" irq1: 0x%x\n", parse.cftable_entry.irq.IRQInfo1);
-	printk(" irq2: 0x%x\n", parse.cftable_entry.irq.IRQInfo2);
-	printk(" mem flags: 0x%x\n", parse.cftable_entry.mem.flags);
-	printk(" mem nwin: 0x%x\n", parse.cftable_entry.mem.nwin);
-	printk(" subtuples: 0x%x\n", parse.cftable_entry.subtuples);
-#endif
+static void mio_cs_config(struct pcmcia_device *link)
+{
+	int ret;
 
-#if 0
-	link->io.NumPorts1 = 0x20;
-	link->io.IOAddrLines = 5;
-	link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-#endif
-	link->io.NumPorts1 = parse.cftable_entry.io.win[0].len;
-	link->io.IOAddrLines =
-	    parse.cftable_entry.io.flags & CISTPL_IO_LINES_MASK;
-	link->io.NumPorts2 = 0;
+	DPRINTK("mio_cs_config(link=%p)\n", link);
 
-	{
-		int base;
-		for (base = 0x000; base < 0x400; base += 0x20) {
-			link->io.BasePort1 = base;
-			ret = pcmcia_request_io(link, &link->io);
-			/* printk("RequestIO 0x%02x\n",ret); */
-			if (!ret)
-				break;
-		}
+	ret = pcmcia_loop_config(link, mio_pcmcia_config_loop, NULL);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		return;
 	}
 
-	link->irq.IRQInfo1 = parse.cftable_entry.irq.IRQInfo1;
-	link->irq.IRQInfo2 = parse.cftable_entry.irq.IRQInfo2;
 	ret = pcmcia_request_irq(link, &link->irq);
 	if (ret) {
 		printk("pcmcia_request_irq() returned error: %i\n", ret);
 	}
-	/* printk("RequestIRQ 0x%02x\n",ret); */
-
-	link->conf.ConfigIndex = 1;
 
 	ret = pcmcia_request_configuration(link, &link->conf);
-	/* printk("RequestConfiguration %d\n",ret); */
 
 	link->dev_node = &dev_node;
 }
@@ -475,40 +429,17 @@ static int mio_cs_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 	return 0;
 }
 
-static int get_prodid(struct comedi_device *dev, struct pcmcia_device *link)
-{
-	tuple_t tuple;
-	u_short buf[128];
-	int prodid = 0;
-
-	tuple.TupleData = (cisdata_t *) buf;
-	tuple.TupleOffset = 0;
-	tuple.TupleDataMax = 255;
-	tuple.DesiredTuple = CISTPL_MANFID;
-	tuple.Attributes = TUPLE_RETURN_COMMON;
-	if ((pcmcia_get_first_tuple(link, &tuple) == 0) &&
-	    (pcmcia_get_tuple_data(link, &tuple) == 0)) {
-		prodid = le16_to_cpu(buf[1]);
-	}
-
-	return prodid;
-}
-
 static int ni_getboardtype(struct comedi_device *dev,
 			   struct pcmcia_device *link)
 {
-	int id;
 	int i;
 
-	id = get_prodid(dev, link);
-
 	for (i = 0; i < n_ni_boards; i++) {
-		if (ni_boards[i].device_id == id) {
+		if (ni_boards[i].device_id == link->card_id)
 			return i;
-		}
 	}
 
-	printk("unknown board 0x%04x -- pretend it is a ", id);
+	printk("unknown board 0x%04x -- pretend it is a ", link->card_id);
 
 	return 0;
 }
diff --git a/drivers/staging/comedi/drivers/quatech_daqp_cs.c b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
index 344b823..48e7c27 100644
--- a/drivers/staging/comedi/drivers/quatech_daqp_cs.c
+++ b/drivers/staging/comedi/drivers/quatech_daqp_cs.c
@@ -55,23 +55,6 @@ Devices: [Quatech] DAQP-208 (daqp), DAQP-308
 #include <pcmcia/cisreg.h>
 #include <pcmcia/ds.h>
 
-/*
-   All the PCMCIA modules use PCMCIA_DEBUG to control debugging.  If
-   you do not define PCMCIA_DEBUG at all, all the debug code will be
-   left out.  If you compile with PCMCIA_DEBUG=0, the debug code will
-   be present but disabled -- but it can then be enabled for specific
-   modules at load time with a 'pc_debug=#' option to insmod.
-*/
-
-#ifdef PCMCIA_DEBUG
-static int pc_debug = PCMCIA_DEBUG;
-module_param(pc_debug, int, 0644);
-#define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
-static char *version = "quatech_daqp_cs.c 1.10 2003/04/21 (Brent Baccala)";
-#else
-#define DEBUG(n, args...)
-#endif
-
 /* Maximum number of separate DAQP devices we'll allow */
 #define MAX_DEV         4
 
@@ -863,8 +846,6 @@ static int daqp_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 {
 	int ret;
 	struct local_info_t *local = dev_table[it->options[0]];
-	tuple_t tuple;
-	int i;
 	struct comedi_subdevice *s;
 
 	if (it->options[0] < 0 || it->options[0] >= MAX_DEV || !local) {
@@ -883,29 +864,10 @@ static int daqp_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 
 	strcpy(local->board_name, "DAQP");
 	dev->board_name = local->board_name;
-
-	tuple.DesiredTuple = CISTPL_VERS_1;
-	if (pcmcia_get_first_tuple(local->link, &tuple) == 0) {
-		u_char buf[128];
-
-		buf[0] = buf[sizeof(buf) - 1] = 0;
-		tuple.TupleData = buf;
-		tuple.TupleDataMax = sizeof(buf);
-		tuple.TupleOffset = 2;
-		if (pcmcia_get_tuple_data(local->link, &tuple) == 0) {
-
-			for (i = 0; i < tuple.TupleDataLen - 4; i++)
-				if (buf[i] == 0)
-					break;
-			for (i++; i < tuple.TupleDataLen - 4; i++)
-				if (buf[i] == 0)
-					break;
-			i++;
-			if ((i < tuple.TupleDataLen - 4)
-			    && (strncmp(buf + i, "DAQP", 4) == 0)) {
-				strncpy(local->board_name, buf + i,
-					sizeof(local->board_name));
-			}
+	if (local->link->prod_id[2]) {
+		if (strncmp(local->link->prod_id[2], "DAQP", 4) == 0) {
+			strncpy(local->board_name, local->link->prod_id[2],
+				sizeof(local->board_name));
 		}
 	}
 
@@ -1058,7 +1020,7 @@ static int daqp_cs_attach(struct pcmcia_device *link)
 	struct local_info_t *local;
 	int i;
 
-	DEBUG(0, "daqp_cs_attach()\n");
+	dev_dbg(&link->dev, "daqp_cs_attach()\n");
 
 	for (i = 0; i < MAX_DEV; i++)
 		if (dev_table[i] == NULL)
@@ -1112,7 +1074,7 @@ static void daqp_cs_detach(struct pcmcia_device *link)
 {
 	struct local_info_t *dev = link->priv;
 
-	DEBUG(0, "daqp_cs_detach(0x%p)\n", link);
+	dev_dbg(&link->dev, "daqp_cs_detach\n");
 
 	if (link->dev_node) {
 		dev->stop = 1;
@@ -1134,115 +1096,54 @@ static void daqp_cs_detach(struct pcmcia_device *link)
 
 ======================================================================*/
 
-static void daqp_cs_config(struct pcmcia_device *link)
-{
-	struct local_info_t *dev = link->priv;
-	tuple_t tuple;
-	cisparse_t parse;
-	int last_ret;
-	u_char buf[64];
-
-	DEBUG(0, "daqp_cs_config(0x%p)\n", link);
-
-	/*
-	   This reads the card's CONFIG tuple to find its configuration
-	   registers.
-	 */
-	tuple.DesiredTuple = CISTPL_CONFIG;
-	tuple.Attributes = 0;
-	tuple.TupleData = buf;
-	tuple.TupleDataMax = sizeof(buf);
-	tuple.TupleOffset = 0;
-
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
-	}
 
-	last_ret = pcmcia_get_tuple_data(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetTupleData, last_ret);
-		goto cs_failed;
-	}
-
-	last_ret = pcmcia_parse_tuple(&tuple, &parse);
-	if (last_ret) {
-		cs_error(link, ParseTuple, last_ret);
-		goto cs_failed;
-	}
-	link->conf.ConfigBase = parse.config.base;
-	link->conf.Present = parse.config.rmask[0];
+static int daqp_pcmcia_config_loop(struct pcmcia_device *p_dev,
+				cistpl_cftable_entry_t *cfg,
+				cistpl_cftable_entry_t *dflt,
+				unsigned int vcc,
+				void *priv_data)
+{
+	if (cfg->index == 0)
+		return -ENODEV;
 
-	/*
-	   In this loop, we scan the CIS for configuration table entries,
-	   each of which describes a valid card configuration, including
-	   voltage, IO window, memory window, and interrupt settings.
-
-	   We make no assumptions about the card to be configured: we use
-	   just the information available in the CIS.  In an ideal world,
-	   this would work for any PCMCIA card, but it requires a complete
-	   and accurate CIS.  In practice, a driver usually "knows" most of
-	   these things without consulting the CIS, and most client drivers
-	   will only use the CIS to fill in implementation-defined details.
-	 */
-	tuple.DesiredTuple = CISTPL_CFTABLE_ENTRY;
-	last_ret = pcmcia_get_first_tuple(link, &tuple);
-	if (last_ret) {
-		cs_error(link, GetFirstTuple, last_ret);
-		goto cs_failed;
+	/* Do we need to allocate an interrupt? */
+	if (cfg->irq.IRQInfo1 || dflt->irq.IRQInfo1)
+		p_dev->conf.Attributes |= CONF_ENABLE_IRQ;
+
+	/* IO window settings */
+	p_dev->io.NumPorts1 = p_dev->io.NumPorts2 = 0;
+	if ((cfg->io.nwin > 0) || (dflt->io.nwin > 0)) {
+		cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt->io;
+		p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
+		if (!(io->flags & CISTPL_IO_8BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
+		if (!(io->flags & CISTPL_IO_16BIT))
+			p_dev->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
+		p_dev->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
+		p_dev->io.BasePort1 = io->win[0].base;
+		p_dev->io.NumPorts1 = io->win[0].len;
+		if (io->nwin > 1) {
+			p_dev->io.Attributes2 = p_dev->io.Attributes1;
+			p_dev->io.BasePort2 = io->win[1].base;
+			p_dev->io.NumPorts2 = io->win[1].len;
+		}
 	}
 
-	while (1) {
-		cistpl_cftable_entry_t dflt = { 0 };
-		cistpl_cftable_entry_t *cfg = &(parse.cftable_entry);
-		if (pcmcia_get_tuple_data(link, &tuple))
-			goto next_entry;
-		if (pcmcia_parse_tuple(&tuple, &parse))
-			goto next_entry;
-
-		if (cfg->flags & CISTPL_CFTABLE_DEFAULT)
-			dflt = *cfg;
-		if (cfg->index == 0)
-			goto next_entry;
-		link->conf.ConfigIndex = cfg->index;
-
-		/* Do we need to allocate an interrupt? */
-		if (cfg->irq.IRQInfo1 || dflt.irq.IRQInfo1)
-			link->conf.Attributes |= CONF_ENABLE_IRQ;
-
-		/* IO window settings */
-		link->io.NumPorts1 = link->io.NumPorts2 = 0;
-		if ((cfg->io.nwin > 0) || (dflt.io.nwin > 0)) {
-			cistpl_io_t *io = (cfg->io.nwin) ? &cfg->io : &dflt.io;
-			link->io.Attributes1 = IO_DATA_PATH_WIDTH_AUTO;
-			if (!(io->flags & CISTPL_IO_8BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_16;
-			if (!(io->flags & CISTPL_IO_16BIT))
-				link->io.Attributes1 = IO_DATA_PATH_WIDTH_8;
-			link->io.IOAddrLines = io->flags & CISTPL_IO_LINES_MASK;
-			link->io.BasePort1 = io->win[0].base;
-			link->io.NumPorts1 = io->win[0].len;
-			if (io->nwin > 1) {
-				link->io.Attributes2 = link->io.Attributes1;
-				link->io.BasePort2 = io->win[1].base;
-				link->io.NumPorts2 = io->win[1].len;
-			}
-		}
+	/* This reserves IO space but doesn't actually enable it */
+	return pcmcia_request_io(p_dev, &p_dev->io);
+}
 
-		/* This reserves IO space but doesn't actually enable it */
-		if (pcmcia_request_io(link, &link->io))
-			goto next_entry;
+static void daqp_cs_config(struct pcmcia_device *link)
+{
+	struct local_info_t *dev = link->priv;
+	int ret;
 
-		/* If we got this far, we're cool! */
-		break;
+	dev_dbg(&link->dev, "daqp_cs_config\n");
 
-next_entry:
-		last_ret = pcmcia_get_next_tuple(link, &tuple);
-		if (last_ret) {
-			cs_error(link, GetNextTuple, last_ret);
-			goto cs_failed;
-		}
+	ret = pcmcia_loop_config(link, daqp_pcmcia_config_loop, NULL);
+	if (ret) {
+		dev_warn(&link->dev, "no configuration found\n");
+		goto failed;
 	}
 
 	/*
@@ -1251,11 +1152,9 @@ next_entry:
 	   irq structure is initialized.
 	 */
 	if (link->conf.Attributes & CONF_ENABLE_IRQ) {
-		last_ret = pcmcia_request_irq(link, &link->irq);
-		if (last_ret) {
-			cs_error(link, RequestIRQ, last_ret);
-			goto cs_failed;
-		}
+		ret = pcmcia_request_irq(link, &link->irq);
+		if (ret)
+			goto failed;
 	}
 
 	/*
@@ -1263,11 +1162,9 @@ next_entry:
 	   the I/O windows and the interrupt mapping, and putting the
 	   card and host interface into "Memory and IO" mode.
 	 */
-	last_ret = pcmcia_request_configuration(link, &link->conf);
-	if (last_ret) {
-		cs_error(link, RequestConfiguration, last_ret);
-		goto cs_failed;
-	}
+	ret = pcmcia_request_configuration(link, &link->conf);
+	if (ret)
+		goto failed;
 
 	/*
 	   At this point, the dev_node_t structure(s) need to be
@@ -1296,14 +1193,14 @@ next_entry:
 
 	return;
 
-cs_failed:
+failed:
 	daqp_cs_release(link);
 
 }				/* daqp_cs_config */
 
 static void daqp_cs_release(struct pcmcia_device *link)
 {
-	DEBUG(0, "daqp_cs_release(0x%p)\n", link);
+	dev_dbg(&link->dev, "daqp_cs_release\n");
 
 	pcmcia_disable_device(link);
 }				/* daqp_cs_release */
@@ -1363,7 +1260,6 @@ struct pcmcia_driver daqp_cs_driver = {
 
 int __init init_module(void)
 {
-	DEBUG(0, "%s\n", version);
 	pcmcia_register_driver(&daqp_cs_driver);
 	comedi_driver_register(&driver_daqp);
 	return 0;
@@ -1371,7 +1267,6 @@ int __init init_module(void)
 
 void __exit cleanup_module(void)
 {
-	DEBUG(0, "daqp_cs: unloading\n");
 	comedi_driver_unregister(&driver_daqp);
 	pcmcia_unregister_driver(&daqp_cs_driver);
 }
-- 
1.6.0.4

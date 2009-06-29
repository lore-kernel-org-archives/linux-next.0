From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 13:58:35 +0200
Message-ID: <20090629115835.GA2308@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45653 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751226AbZF2L6g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 07:58:36 -0400
Content-Disposition: inline
In-Reply-To: <20090629115038.GD9321@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

 n Mon, Jun 29, 2009 at 01:50:38PM +0200, Heiko Carstens wrote:
> On Mon, Jun 29, 2009 at 12:39:43PM +0200, Nick Piggin wrote:
> > On Mon, Jun 29, 2009 at 12:31:23PM +0200, Heiko Carstens wrote:
> > > On Mon, Jun 29, 2009 at 03:14:40PM +0530, Sachin Sant wrote:
> > > > I still have problems booting next with SLQB on a s390 box.
> > > >
> > > > Write protected kernel read-only data: 0x12000 - 0x446fff
> > > > Experimental hierarchical RCU implementation.
> > > > Experimental hierarchical RCU init done.
> > > > console =DDttyS0=A8 enabled
> > > > Unable to handle kernel pointer dereference at virtual kernel a=
ddress (null)
> >=20
> > This could I suppose be due to failed allocation where the caller
> > isn't expecting failure (or using SLAB_PANIC).
> >=20
> > Did you manage to test with the prink debugging patch for SLQB that
> > I sent for the power6 boot failure? I don't think I saw a reply fro=
m
> > you but maybe I missed it?
>=20
> Could you send me the debug patch as well? I can give it a quick run =
as well.

This is what I had. It is only helpful for the power6
failure where there was a problem in an allocation from
kmem_cache_create.

---
 mm/slqb.c |   40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

Index: linux-2.6/mm/slqb.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/mm/slqb.c
+++ linux-2.6/mm/slqb.c
@@ -1456,7 +1456,7 @@ static void *__remote_slab_alloc_node(st
 }
=20
 static noinline void *__remote_slab_alloc(struct kmem_cache *s,
-				gfp_t gfpflags, int node)
+				gfp_t gfpflags, int node, int trace)
 {
 	void *object;
 	struct zonelist *zonelist;
@@ -1465,19 +1465,32 @@ static noinline void *__remote_slab_allo
 	enum zone_type high_zoneidx =3D gfp_zone(gfpflags);
=20
 	object =3D __remote_slab_alloc_node(s, gfpflags, node);
+	if (trace && !object)
+		printk("__remote_slab_alloc_node(node:%d) failed\n", node);
 	if (likely(object || (gfpflags & __GFP_THISNODE)))
 		return object;
=20
-	zonelist =3D node_zonelist(slab_node(current->mempolicy), gfpflags);
+	node =3D slab_node(current->mempolicy);
+	if (trace)
+		printk("slab_node(current->mempolicy) =3D %d\n", node);
+
+	zonelist =3D node_zonelist(node, gfpflags);
 	for_each_zone_zonelist(zone, z, zonelist, high_zoneidx) {
-		if (!cpuset_zone_allowed_hardwall(zone, gfpflags))
+		if (!cpuset_zone_allowed_hardwall(zone, gfpflags)) {
+			if (trace)
+				printk("cpuset not allowed node:%d\n", zone_to_nid(zone));
 			continue;
+		}
=20
 		node =3D zone_to_nid(zone);
 		object =3D __remote_slab_alloc_node(s, gfpflags, node);
 		if (likely(object))
 			return object;
+		if (trace)
+			printk("__remote_slab_alloc_node(node:%d) failed\n", node);
 	}
+	if (trace)
+		printk("__remote_slab_alloc failed\n");
 	return NULL;
 }
 #endif
@@ -1488,7 +1501,7 @@ static noinline void *__remote_slab_allo
  * Must be called with interrupts disabled.
  */
 static __always_inline void *__slab_alloc(struct kmem_cache *s,
-				gfp_t gfpflags, int node)
+				gfp_t gfpflags, int node, int trace)
 {
 	void *object;
 	struct kmem_cache_cpu *c;
@@ -1497,7 +1510,7 @@ static __always_inline void *__slab_allo
 #ifdef CONFIG_NUMA
 	if (unlikely(node !=3D -1) && unlikely(node !=3D numa_node_id())) {
 try_remote:
-		return __remote_slab_alloc(s, gfpflags, node);
+		return __remote_slab_alloc(s, gfpflags, node, trace);
 	}
 #endif
=20
@@ -1509,6 +1522,8 @@ try_remote:
 		object =3D cache_list_get_page(s, l);
 		if (unlikely(!object)) {
 			object =3D __slab_alloc_page(s, gfpflags, node);
+			if (trace && !object)
+				printk("__slab_alloc_page(node:%d) failed\n", node);
 #ifdef CONFIG_NUMA
 			if (unlikely(!object)) {
 				node =3D numa_node_id();
@@ -1532,10 +1547,11 @@ static __always_inline void *slab_alloc(
 {
 	void *object;
 	unsigned long flags;
+	int trace =3D 0;
=20
 again:
 	local_irq_save(flags);
-	object =3D __slab_alloc(s, gfpflags, node);
+	object =3D __slab_alloc(s, gfpflags, node, trace);
 	local_irq_restore(flags);
=20
 	if (unlikely(slab_debug(s)) && likely(object)) {
@@ -1546,6 +1562,18 @@ again:
 	if (unlikely(gfpflags & __GFP_ZERO) && likely(object))
 		memset(object, 0, s->objsize);
=20
+	if (!object && !trace) {
+		trace =3D 1;
+		dump_stack();
+		printk("slab_alloc allocation failed\n");
+		printk("slab:%s flags:%x node:%d\n", s->name, gfpflags, node);
+		goto again;
+	}
+	if (trace) {
+		if (object)
+			printk("slab_alloc allocation worked when being traced, bugger\n");
+	}
+
 	return object;
 }
=20

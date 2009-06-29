From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Mon, 29 Jun 2009 16:12:34 +0200
Message-ID: <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com> <20090629115835.GA2308@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate7.uk.ibm.com ([195.212.29.140]:51986 "EHLO
	mtagate7.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbZF2OMc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2009 10:12:32 -0400
Content-Disposition: inline
In-Reply-To: <20090629115835.GA2308@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 01:58:35PM +0200, Nick Piggin wrote:
>  n Mon, Jun 29, 2009 at 01:50:38PM +0200, Heiko Carstens wrote:
> > On Mon, Jun 29, 2009 at 12:39:43PM +0200, Nick Piggin wrote:
> > > On Mon, Jun 29, 2009 at 12:31:23PM +0200, Heiko Carstens wrote:
> > > > On Mon, Jun 29, 2009 at 03:14:40PM +0530, Sachin Sant wrote:
> > > > > I still have problems booting next with SLQB on a s390 box.
> > > > >
> > > > > Write protected kernel read-only data: 0x12000 - 0x446fff
> > > > > Experimental hierarchical RCU implementation.
> > > > > Experimental hierarchical RCU init done.
> > > > > console =DDttyS0=A8 enabled
> > > > > Unable to handle kernel pointer dereference at virtual kernel=
 address (null)
> > >=20
> > > This could I suppose be due to failed allocation where the caller
> > > isn't expecting failure (or using SLAB_PANIC).
> > >=20
> > > Did you manage to test with the prink debugging patch for SLQB th=
at
> > > I sent for the power6 boot failure? I don't think I saw a reply f=
rom
> > > you but maybe I missed it?
> >=20
> > Could you send me the debug patch as well? I can give it a quick ru=
n as well.
>=20
> This is what I had. It is only helpful for the power6
> failure where there was a problem in an allocation from
> kmem_cache_create.

slqb returns ZERO_SIZE_PTR instead of NULL for large size requests it c=
annot
handle.
The patch below would fix it. But I think its too ugly. So I leave it u=
p to
Nick to come up with a real and nice patch ;)

diff --git a/include/linux/slqb_def.h b/include/linux/slqb_def.h
index 7b4a601..9d03485 100644
--- a/include/linux/slqb_def.h
+++ b/include/linux/slqb_def.h
@@ -187,7 +187,7 @@ static __always_inline int kmalloc_index(size_t siz=
e)
 	if (unlikely(!size))
 		return 0;
 	if (unlikely(size > 1UL << KMALLOC_SHIFT_SLQB_HIGH))
-		return 0;
+		return -1;
=20
 	if (unlikely(size <=3D KMALLOC_MIN_SIZE))
 		return KMALLOC_SHIFT_LOW;
@@ -219,7 +219,7 @@ static __always_inline int kmalloc_index(size_t siz=
e)
 	if (size <=3D 512 * 1024) return 19;
 	if (size <=3D 1024 * 1024) return 20;
 	if (size <=3D  2 * 1024 * 1024) return 21;
-	return -1;
+	return -2;
 }
=20
 #ifdef CONFIG_ZONE_DMA
@@ -239,8 +239,12 @@ static __always_inline struct kmem_cache *kmalloc_=
slab(size_t size, gfp_t flags)
 	int index;
=20
 	index =3D kmalloc_index(size);
-	if (unlikely(index =3D=3D 0))
-		return ZERO_SIZE_PTR;
+	if (unlikely(index <=3D 0)) {
+		if (index =3D=3D 0)
+			return ZERO_SIZE_PTR;
+		if (index =3D=3D -1)
+			return NULL;
+	}
=20
 	if (likely(!(flags & SLQB_DMA)))
 		return &kmalloc_caches[index];

From: Michal Nazarewicz <mina86@mina86.com>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Date: Fri, 03 Oct 2014 21:28:17 +0200
Message-ID: <xa1tr3yp2bse.fsf@mina86.com>
References: <20141003173004.7ac4edce@canb.auug.org.au> <20141003112154.92b5a47b2009293090d18f5a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141003112154.92b5a47b2009293090d18f5a@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, Josh Cartwright <joshc@codeaurora.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 03 2014, Andrew Morton wrote:
> On Fri, 3 Oct 2014 17:30:04 +1000 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>
>> Hi Andrew,
>>=20
>> After merging the akpm-current tree, today's linux-next build (arm
>> multi_v7_defconfig) produced these warnings:
>>=20
>> drivers/base/dma-contiguous.c:244:2: warning: initialization from in=
compatible pointer type
>>   .device_init =3D rmem_cma_device_init,
>>   ^
>> drivers/base/dma-contiguous.c:244:2: warning: (near initialization f=
or 'rmem_cma_ops.device_init')
>> drivers/base/dma-coherent.c:303:2: warning: initialization from inco=
mpatible pointer type
>>   .device_init =3D rmem_dma_device_init,
>>   ^
>>=20
>> Introduced by commit e92f6296f3a2 ("drivers: dma-coherent: add
>> initialization from device tree").  This init routine is supposed to
>> return void ...
>
> I'm a bit reluctant to just go in and change rmem_cma_device_init().
>
> Why does it test for rmem->priv=3D=3DNULL?  Can that really happen?  =
Why?=20
> Is it a legitimate state?

I don't think so, since:

static int __init rmem_cma_setup(struct reserved_mem *rmem)
{
	[=E2=80=A6]
	rmem->ops =3D &rmem_cma_ops;
	rmem->priv =3D cma;
	[=E2=80=A6]
}

The following should fix the warning:

diff --git a/drivers/base/dma-contiguous.c b/drivers/base/dma-contiguou=
s.c
index 6c42289..a9a88b6 100644
--- a/drivers/base/dma-contiguous.c
+++ b/drivers/base/dma-contiguous.c
@@ -223,14 +223,9 @@ bool dma_release_from_contiguous(struct device *de=
v, struct page *pages,
 #undef pr_fmt
 #define pr_fmt(fmt) fmt
=20
-static int rmem_cma_device_init(struct reserved_mem *rmem, struct devi=
ce *dev)
+static void rmem_cma_device_init(struct reserved_mem *rmem, struct dev=
ice *dev)
 {
-	struct cma *cma =3D rmem->priv;
-
-	if (!cma)
-		return -ENODEV;
-
-	dev_set_cma_area(dev, cma);
+	dev_set_cma_area(dev, rmem->priv);
 	return 0;
 }

Even if rmem->priv is NULL, the call will simply clear device's
cma_area, but at this point it should be NULL anyway.
=20
> And why does dev_set_cma_area() test for dev=3D=3DNULL?  Can that rea=
lly
> happen?  Is it legitimate?  Is all this stuff just papering over othe=
r
> bugs?

I believe since a2547380393ac82c659b40182b0da8d05a8365f3 dev no longer
can be NULL.  It should be safe to apply this:

diff --git a/include/linux/dma-contiguous.h b/include/linux/dma-contigu=
ous.h
index 569bbd0..ff9804e 100644
--- a/include/linux/dma-contiguous.h
+++ b/include/linux/dma-contiguous.h
@@ -71,8 +71,7 @@ static inline struct cma *dev_get_cma_area(struct dev=
ice *dev)
=20
 static inline void dev_set_cma_area(struct device *dev, struct cma *cm=
a)
 {
-	if (dev)
-		dev->cma_area =3D cma;
+	dev->cma_area =3D cma;
 }
=20
 static inline void dma_contiguous_set_default(struct cma *cma)

>
> The whole thing could do with a bit of an audit and cleanup, I suspec=
t.
> Get the states and initialization sequences and error checking all
> sorted out, then get rid of all these tests for NULL.
>

--=20
Best regards,                                         _     _
=2Eo. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
=2E.o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarew=
icz    (o o)
ooo +--<mpn@google.com>--<xmpp:mina86@jabber.org>--ooO--(_)--Ooo--

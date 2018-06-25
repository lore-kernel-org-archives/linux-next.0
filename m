From: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/2] sample/mdev/mbochs: remove mbochs_kmap_atomic_dmabuf
Date: Mon, 25 Jun 2018 15:43:30 +0000
Message-ID: <487f3b7d-4c59-4110-a00b-217e112f2b05@email.android.com>
References: <20180625064453.19768-1-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0918341107=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180625064453.19768-1-kraxel@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "open list:VFIO MEDIATED DEVICE DRIVERS" <kvm@vger.kernel.org>, "airlied@linux.ie" <airlied@linux.ie>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>
List-Id: linux-next.vger.kernel.org

--===============0918341107==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_487f3b7d4c594110a00b217e112f2b05emailandroidcom_"

--_000_487f3b7d4c594110a00b217e112f2b05emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Christian K=F6nig <christian.koenig@amd.com>

Am 25.06.2018 08:45 schrieb Gerd Hoffmann <kraxel@redhat.com>:
Atomic mapping interface for dmabufs will be removed.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 samples/vfio-mdev/mbochs.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 2960e26c6e..aa25cda21d 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -803,15 +803,6 @@ static void mbochs_release_dmabuf(struct dma_buf *buf)
         mutex_unlock(&mdev_state->ops_lock);
 }

-static void *mbochs_kmap_atomic_dmabuf(struct dma_buf *buf,
-                                      unsigned long page_num)
-{
-       struct mbochs_dmabuf *dmabuf =3D buf->priv;
-       struct page *page =3D dmabuf->pages[page_num];
-
-       return kmap_atomic(page);
-}
-
 static void *mbochs_kmap_dmabuf(struct dma_buf *buf, unsigned long page_nu=
m)
 {
         struct mbochs_dmabuf *dmabuf =3D buf->priv;
@@ -824,7 +815,6 @@ static struct dma_buf_ops mbochs_dmabuf_ops =3D {
         .map_dma_buf      =3D mbochs_map_dmabuf,
         .unmap_dma_buf    =3D mbochs_unmap_dmabuf,
         .release          =3D mbochs_release_dmabuf,
-       .map_atomic       =3D mbochs_kmap_atomic_dmabuf,
         .map              =3D mbochs_kmap_dmabuf,
         .mmap             =3D mbochs_mmap_dmabuf,
 };
--
2.9.3


--_000_487f3b7d4c594110a00b217e112f2b05emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Acked-by: Christian K=F6nig &lt;christian.koenig@amd.com&=
gt;</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 25.06.2018 08:45 schrieb Gerd Hoffmann &lt;=
kraxel@redhat.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Atomic mapping interface for dmabufs will be remov=
ed.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;kraxel@redhat.com&gt;<br>
---<br>
&nbsp;samples/vfio-mdev/mbochs.c | 10 ----------<br>
&nbsp;1 file changed, 10 deletions(-)<br>
<br>
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c<br>
index 2960e26c6e..aa25cda21d 100644<br>
--- a/samples/vfio-mdev/mbochs.c<br>
&#43;&#43;&#43; b/samples/vfio-mdev/mbochs.c<br>
@@ -803,15 &#43;803,6 @@ static void mbochs_release_dmabuf(struct dma_buf *=
buf)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;mdev_sta=
te-&gt;ops_lock);<br>
&nbsp;}<br>
&nbsp;<br>
-static void *mbochs_kmap_atomic_dmabuf(struct dma_buf *buf,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
nsigned long page_num)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mbochs_dmabuf *dmabuf =3D buf-=
&gt;priv;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct page *page =3D dmabuf-&gt;page=
s[page_num];<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return kmap_atomic(page);<br>
-}<br>
-<br>
&nbsp;static void *mbochs_kmap_dmabuf(struct dma_buf *buf, unsigned long pa=
ge_num)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mbochs_dmabuf *dmab=
uf =3D buf-&gt;priv;<br>
@@ -824,7 &#43;815,6 @@ static struct dma_buf_ops mbochs_dmabuf_ops =3D {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map_dma_buf&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D mbochs_map_dmabuf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unmap_dma_buf&nbsp;&nbsp;=
&nbsp; =3D mbochs_unmap_dmabuf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .release&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D mbochs_release_dmabuf,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map_atomic&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; =3D mbochs_kmap_atomic_dmabuf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .map&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D mbochs_kmap_dm=
abuf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .mmap&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D mbochs_mmap_dmabuf,=
<br>
&nbsp;};<br>
-- <br>
2.9.3<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_487f3b7d4c594110a00b217e112f2b05emailandroidcom_--

--===============0918341107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0918341107==--

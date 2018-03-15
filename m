From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the asm-generic tree
Date: Fri, 16 Mar 2018 09:13:55 +1100
Message-ID: <20180316091355.2d2b7b04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/umKnlmX/lxALQopnVGFj6me"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aaron Wu <aaron.wu@analog.com>, Bin Liu <b-liu@ti.com>
List-Id: linux-next.vger.kernel.org

--Sig_/umKnlmX/lxALQopnVGFj6me
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

After merging the asm-generic tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/usb/musb/musb_host.c: In function 'musb_rx_reinit':
drivers/usb/musb/musb_host.c:577:10: error: 'struct musb' has no member nam=
ed 'double_buffer_not_ok'
  if (musb->double_buffer_not_ok)
          ^~
drivers/usb/musb/musb_host.c: In function 'musb_ep_program':
drivers/usb/musb/musb_host.c:807:12: error: 'struct musb' has no member nam=
ed 'double_buffer_not_ok'
    if (musb->double_buffer_not_ok) {
            ^~

Caused by commit

  8312c0cad792 ("usb: musb: remove blackfin port")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Mar 2018 08:58:41 +1100
Subject: [PATCH] usb: musb: more blackfin removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/musb/musb_gadget.c | 21 +++++++--------------
 drivers/usb/musb/musb_host.c   | 12 +++---------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 58a41b54763b..e564695c6c8d 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -995,15 +995,11 @@ static int musb_gadget_enable(struct usb_ep *ep,
 		/* Set TXMAXP with the FIFO size of the endpoint
 		 * to disable double buffering mode.
 		 */
-		if (musb->double_buffer_not_ok) {
-			musb_writew(regs, MUSB_TXMAXP, hw_ep->max_packet_sz_tx);
-		} else {
-			if (can_bulk_split(musb, musb_ep->type))
-				musb_ep->hb_mult =3D (hw_ep->max_packet_sz_tx /
-							musb_ep->packet_sz) - 1;
-			musb_writew(regs, MUSB_TXMAXP, musb_ep->packet_sz
-					| (musb_ep->hb_mult << 11));
-		}
+		if (can_bulk_split(musb, musb_ep->type))
+			musb_ep->hb_mult =3D (hw_ep->max_packet_sz_tx /
+						musb_ep->packet_sz) - 1;
+		musb_writew(regs, MUSB_TXMAXP, musb_ep->packet_sz
+				| (musb_ep->hb_mult << 11));
=20
 		csr =3D MUSB_TXCSR_MODE | MUSB_TXCSR_CLRDATATOG;
 		if (musb_readw(regs, MUSB_TXCSR)
@@ -1038,11 +1034,8 @@ static int musb_gadget_enable(struct usb_ep *ep,
 		/* Set RXMAXP with the FIFO size of the endpoint
 		 * to disable double buffering mode.
 		 */
-		if (musb->double_buffer_not_ok)
-			musb_writew(regs, MUSB_RXMAXP, hw_ep->max_packet_sz_tx);
-		else
-			musb_writew(regs, MUSB_RXMAXP, musb_ep->packet_sz
-					| (musb_ep->hb_mult << 11));
+		musb_writew(regs, MUSB_RXMAXP, musb_ep->packet_sz
+				| (musb_ep->hb_mult << 11));
=20
 		/* force shared fifo to OUT-only mode */
 		if (hw_ep->is_shared_fifo) {
diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 45ed32c2cba9..3a8451a15f7f 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -574,11 +574,8 @@ musb_rx_reinit(struct musb *musb, struct musb_qh *qh, =
u8 epnum)
 	/* Set RXMAXP with the FIFO size of the endpoint
 	 * to disable double buffer mode.
 	 */
-	if (musb->double_buffer_not_ok)
-		musb_writew(ep->regs, MUSB_RXMAXP, ep->max_packet_sz_rx);
-	else
-		musb_writew(ep->regs, MUSB_RXMAXP,
-				qh->maxpacket | ((qh->hb_mult - 1) << 11));
+	musb_writew(ep->regs, MUSB_RXMAXP,
+			qh->maxpacket | ((qh->hb_mult - 1) << 11));
=20
 	ep->rx_reinit =3D 0;
 }
@@ -804,10 +801,7 @@ static void musb_ep_program(struct musb *musb, u8 epnu=
m,
 		/* protocol/endpoint/interval/NAKlimit */
 		if (epnum) {
 			musb_writeb(epio, MUSB_TXTYPE, qh->type_reg);
-			if (musb->double_buffer_not_ok) {
-				musb_writew(epio, MUSB_TXMAXP,
-						hw_ep->max_packet_sz_tx);
-			} else if (can_bulk_split(musb, qh->type)) {
+			if (can_bulk_split(musb, qh->type)) {
 				qh->hb_mult =3D hw_ep->max_packet_sz_tx
 						/ packet_sz;
 				musb_writew(epio, MUSB_TXMAXP, packet_sz
--=20
2.16.1

--=20
Cheers,
Stephen Rothwell

--Sig_/umKnlmX/lxALQopnVGFj6me
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqq8CMACgkQAVBC80lX
0GzSfAf/QV1gaMeA64E61bLdUEgrJZSNBnl0z9J922HO5JWmPpqVKEZQx+miQT0H
tBlqt+pgkQt7iBC/CBhM4WZLyAiazvnwUVu/F4LRNvqPx/J85Iq0kZ8EbzHvBsJp
frnVoMidQPotuS5O6LahBi2CUaoDBU0Wh8TDu0rpR4PNgeuVlHt9hfQzFMLjl1iN
zDcjGK0MAslCmx7IacxATIWk3/SKKaN7lE0h91dQJltoodSwVlQ+5Q9RyjQgG/bu
vlgyWaElz6vZtah9B7hNbUSHAOckHDpKHBbFPERO9NOfOTJQQhMD9xKMXuHnF54G
ZpOd27pB5qYSjE4YnSc/BYTCVV65cA==
=1kQm
-----END PGP SIGNATURE-----

--Sig_/umKnlmX/lxALQopnVGFj6me--

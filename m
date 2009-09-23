From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: block tree build failure
Date: Wed, 23 Sep 2009 14:51:00 +1000
Message-ID: <20090923145100.1917fdd8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4522270044658492770=="
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============4522270044658492770==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Sep_2009_14_51_00_+1000_md+gh/kdb37K7X/P"

--Signature=_Wed__23_Sep_2009_14_51_00_+1000_md+gh/kdb37K7X/P
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/block/drbd/drbd_tracing.c:29:26: error: linux/marker.h: No such fil=
e or directory

Caused by commit 95eaef1cbc63f73df4ff8559dd66b1d29b462535 ("Replaced our
own tracing stuff with Linux's tracepoints") from the block/drbd trees
interacting with commit fc5377668c3d808e1d53c4aee152c836f55c3490
("tracing: Remove markers") from Linus' tree.

I have no idea what the correct thing to do is here, so I have reverted
the merge of the drbd tree into the block tree and will have to drop the
drbd tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Sep_2009_14_51_00_+1000_md+gh/kdb37K7X/P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq5qTQACgkQjjKRsyhoI8yIogCfQaEM3VhhBSBedoMUWkUR078q
taUAnRAveRPQbl6/T0bYS22PKHQA0USY
=QxaM
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Sep_2009_14_51_00_+1000_md+gh/kdb37K7X/P--

--===============4522270044658492770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4522270044658492770==--

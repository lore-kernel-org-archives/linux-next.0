From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: block/drbd tree build failure
Date: Mon, 5 Oct 2009 14:35:52 +1100
Message-ID: <20091005143552.977a2d4d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5330812859860038027=="
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
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

--===============5330812859860038027==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__5_Oct_2009_14_35_52_+1100_2ZCHj9cMIv.fPR.Z"

--Signature=_Mon__5_Oct_2009_14_35_52_+1100_2ZCHj9cMIv.fPR.Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/block/drbd/drbd_req.c: In function '_drbd_start_io_acct':
drivers/block/drbd/drbd_req.c:43: error: subscripted value is neither array=
 nor pointer
drivers/block/drbd/drbd_req.c: In function '_drbd_end_io_acct':
drivers/block/drbd/drbd_req.c:56: error: subscripted value is neither array=
 nor pointer

I reported a similar error against the dbd tree, which was fixed, but now
the commit that caused that error has been reverted and thus we get
this :-(

I have reverted the drbd commits from the block tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__5_Oct_2009_14_35_52_+1100_2ZCHj9cMIv.fPR.Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrJaZgACgkQjjKRsyhoI8wJVACgqTXbwMTIz4i4e7dAsoonH1Rk
gLUAn12cxosRRzbpeEeDygaWaFQVcSiq
=xTzB
-----END PGP SIGNATURE-----

--Signature=_Mon__5_Oct_2009_14_35_52_+1100_2ZCHj9cMIv.fPR.Z--

--===============5330812859860038027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============5330812859860038027==--

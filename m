From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: linux-next: block tree build failure
Date: Wed, 23 Sep 2009 21:56:59 +1000
Message-ID: <20090923215659.2869830d.sfr@canb.auug.org.au>
References: <20090923145100.1917fdd8.sfr@canb.auug.org.au>
	<20090923071152.GA8000@barkeeper1-xen.linbit>
	<20090923111225.GC8000@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2429013998625863043=="
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <20090923111225.GC8000-pI6ZZpWkm2Ob3Om96lsyHpni2hclXnRB@public.gmane.org>
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
To: Lars Ellenberg <lars.ellenberg-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============2429013998625863043==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__23_Sep_2009_21_56_59_+1000_w7R_=bQd.7aXcUls"

--Signature=_Wed__23_Sep_2009_21_56_59_+1000_w7R_=bQd.7aXcUls
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lars,

On Wed, 23 Sep 2009 13:12:25 +0200 Lars Ellenberg <lars.ellenberg-63ez5xqkn6Bhl2p70BpVqQ@public.gmane.org=
m> wrote:
>
> Sorry that it took me so long to have that look.
> We can simply drop that include, we don't even use it.

OK, great.  I guess Jens needs to remerge your tree.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__23_Sep_2009_21_56_59_+1000_w7R_=bQd.7aXcUls
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq6DQsACgkQjjKRsyhoI8zzbQCgpilFr7Gbdiv59BTo3arCrv+0
ynIAn3aNSg5+vQiMsV5lt7dr88Bz2cnW
=e9Gn
-----END PGP SIGNATURE-----

--Signature=_Wed__23_Sep_2009_21_56_59_+1000_w7R_=bQd.7aXcUls--

--===============2429013998625863043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============2429013998625863043==--

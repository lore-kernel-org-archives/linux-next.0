From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] linux-next: 20090926 - drop autoconf.h from
	DRBD driver
Date: Sun, 27 Sep 2009 12:59:43 +1000
Message-ID: <20090927125943.50971de2.sfr@canb.auug.org.au>
References: <20090926152800.a6568e53.sfr@canb.auug.org.au>
	<20090926173143.GA5041@linux.vnet.ibm.com>
	<20090926200839.GA5220@merkur.ravnborg.org>
	<20090927125331.5367db08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4217929682656845288=="
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <20090927125331.5367db08.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
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
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
Cc: linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kamalesh Babulal <kamalesh-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============4217929682656845288==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__27_Sep_2009_12_59_43_+1000_FZvg4XsJq/wFUs_t"

--Signature=_Sun__27_Sep_2009_12_59_43_+1000_FZvg4XsJq/wFUs_t
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Sep 2009 12:53:31 +1000 Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> =
wrote:
>
> So for Greg and Philipp, Sam has added a patch that moves autoconf.h.
> There is no need to include it anywhere anyway, so the above files need
> cleaning up.  I have appended Kamalesh's patch below.  Greg, you may have
> to write your own :-)

I should read the patch :-).  Greg, obviously Kamalesh's patch hits the
staging files as well.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__27_Sep_2009_12_59_43_+1000_FZvg4XsJq/wFUs_t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkq+1R8ACgkQjjKRsyhoI8z3uQCdGAPXCs4h76k/KwjwSSFrymFo
/5cAn3fGlGDtV+xFIIhGli5JAdffcA8F
=N1i5
-----END PGP SIGNATURE-----

--Signature=_Sun__27_Sep_2009_12_59_43_+1000_FZvg4XsJq/wFUs_t--

--===============4217929682656845288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4217929682656845288==--

From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: linux-next: block/drbd tree build warning
Date: Tue, 6 Oct 2009 14:01:54 +1100
Message-ID: <20091006140154.8d94d95c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4178252788202406064=="
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

--===============4178252788202406064==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__6_Oct_2009_14_01_54_+1100_Ai_VUbGcy5ILQKYg"

--Signature=_Tue__6_Oct_2009_14_01_54_+1100_Ai_VUbGcy5ILQKYg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens, Philipp,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/block/drbd/drbd_nl.c: In function 'drbd_nl_init':
drivers/block/drbd/drbd_nl.c:2309: warning: passing argument 3 of 'cn_add_c=
allback' from incompatible pointer type
include/linux/connector.h:167: note: expected 'void (*)(struct cn_msg *, st=
ruct netlink_skb_parms *)' but argument is of type 'void (*)(struct cn_msg =
*)'

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__6_Oct_2009_14_01_54_+1100_Ai_VUbGcy5ILQKYg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkrKsyIACgkQjjKRsyhoI8y6UACfUuJLy6uEuHLILte0KEaJz3y/
pvMAn30N9UidNRzWm5uwOBJnI+4tOuK+
=0HZ9
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Oct_2009_14_01_54_+1100_Ai_VUbGcy5ILQKYg--

--===============4178252788202406064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4178252788202406064==--

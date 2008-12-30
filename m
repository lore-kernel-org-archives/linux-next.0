From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Tue, 30 Dec 2008 19:30:48 +1100
Message-ID: <20081230193048.db7ee462.sfr@canb.auug.org.au>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<adavdt2ru39.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0772813689=="
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adavdt2ru39.fsf@cisco.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Mime-version: 1.0
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Roland Dreier <rdreier@cisco.com>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

--===============0772813689==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Tue__30_Dec_2008_19_30_48_+1100_SoBxO0UzfJZx1KCT"

--Signature=_Tue__30_Dec_2008_19_30_48_+1100_SoBxO0UzfJZx1KCT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roland,

On Mon, 29 Dec 2008 23:38:18 -0800 Roland Dreier <rdreier@cisco.com> wrote:
>
>  > ERROR: ".ipv6_chk_addr" [drivers/infiniband/core/ib_addr.ko] undefined!
>  > ERROR: ".ip6_route_output" [drivers/infiniband/core/ib_addr.ko] undefi=
ned!
>=20
> OK, I pushed out a change that should fix this, so you can drop the
> revert.  Let me know if you see further issues.

I can drop the revert after your fix goes into Linus' tree (since that is
where the breakage is) ... looking forward to it, thanks.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Dec_2008_19_30_48_+1100_SoBxO0UzfJZx1KCT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklZ3DgACgkQjjKRsyhoI8yoXACbBO8xP4EGslvFECUeRZVm/F2U
I6kAn29khtOL4ntFGXnLEbk6bsYjevfP
=2lqu
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Dec_2008_19_30_48_+1100_SoBxO0UzfJZx1KCT--

--===============0772813689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0772813689==--

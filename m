From: Felipe Balbi <balbi@ti.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with Linus' tree
Date: Thu, 17 Jul 2014 10:05:19 -0500
Message-ID: <20140717150514.GG10459@saruman.home>
References: <20140717165238.2e056cba@canb.auug.org.au>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140717165238.2e056cba@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Felipe Balbi <balbi@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Nazarewicz <mina86@mina86.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>
List-Id: linux-next.vger.kernel.org

--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 04:52:38PM +1000, Stephen Rothwell wrote:
> Hi Felipe,
>=20
> Today's linux-next merge of the usb-gadget tree got a conflict in
> include/uapi/linux/usb/functionfs.h between commit 091221417853 ("usb:
> gadget: f_fs: resurect usb_functionfs_descs_head structure") from
> Linus' tree and commit f0175ab51993 ("usb: gadget: f_fs: OS descriptors
> support") from the usb-gadget tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks that is the correct fix :-)

--=20
balbi

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTx+YqAAoJEIaOsuA1yqREtW0P/RAEUff6sYFgRqhTxIJQOxPn
tt+xpv+bhs/nZ3C/blB+bvIaMECnNDfIbvv8PSKaTI3u2LqSW7KAuAXHcO+WrRMp
KVv424pFF50sVlHniYwVKYIu8IqpqvzU/D25B9tkTwfn7GNxlz7/nixRTOVEfFpC
TvjCogzCqXlbwvie6qd4ujD1vfKvbKtZl5tzkiO3IdJSPWDiBavaTRD1AyRexn5C
tZwuIn9/NZ3Mdf5mlU61mS8OwBcpg/ULpb+WKSPMGlI29Fwk7+my4r7J7rHMpW53
u2SCRpTGKMkURjQqls4EVAXkJriXOLgJ8nEdnap2iVvmKTgcE7T9Fjw0G4Aw0zmV
09Kr8Z6lB7Q7jCoS1nP/3PwT3oPZd2ieUJwkseYfnez3iNgWORFuBt9oUWjYo3rY
QHXLamPmMg4Zy2bGKQCgDLQvn+VNYp0IazW9qJ+x8nBfcTeOZ3zi3ZyrF6XqsL/7
UerwkVToxhg9M/C3XqJPt9z9PsW/RyQZkjCCxRtc1Gts7IYaW+KT3mwlYunVixjP
4JuwLWjScXJWuN2b1IAlYiiJittDeJOGFuBlmVb8Wwq0faxXxbmdKKDA6/92hikv
h8mjABnpZedXPghCS0nLolAH+Di+DHiHJQm2iiyQKpDvdVZ6tm8XvezSdj1sMd9/
bjKRJBfcvHSqjATEIUem
=yPBl
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--

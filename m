From: Mark Salter <msalter@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm
 tree
Date: Thu, 24 Apr 2014 10:27:17 -0400
Message-ID: <1398349637.3010.68.camel@deneb.redhat.com>
References: <20140424152516.47a704ec9b749f98b9a93048@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-tdbjfuO+TpuUFruJcMmH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140424152516.47a704ec9b749f98b9a93048@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Russell King <linux@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Hua <sdu.liu@huawei.com>
List-Id: linux-next.vger.kernel.org


--=-tdbjfuO+TpuUFruJcMmH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-04-24 at 15:25 +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in
> arch/arm/include/asm/fixmap.h between commits 4221e2e6b316 ("ARM: 8031/1:
> fixmap: remove FIX_KMAP_BEGIN and FIX_KMAP_END") and a05e54c103b0 ("ARM:
> 8031/2: change fixmap mapping region to support 32 CPUs") from the arm
> tree and commit a665f864487d ("arm: use generic fixmap.h") from the
> akpm-current tree.
>=20
> I fixed it up (I have just dropped the akpm-current tree patch for now)
> and can carry the fix as necessary (no action is required).

I'm okay with just dropping it from Andrew's tree. We never got an ack
for it. Now that the generic fixmap and early_ioremap patches are in
Linus' tree, it would probably be best to fold the arm fixmap change
into a new patch set adding early_ioremap to arm.

--Mark


--=-tdbjfuO+TpuUFruJcMmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABAgAGBQJTWR9cAAoJEOiN4VijXeFPOi4P/3WArQrh9Ge9Y4dNnbl77zRE
S0yhpJHAHmE6YI613zeX0uPfl5/MES+QAKziIiykfdmQi3aaEK9S9qot5BTSyZXq
nGqKgE5GFB97/Nve/9H+4KuPRJ1LcY6TQjTxqSAAQ11jVetlq5Zs0CeIRkn/2HN0
AoSHtw3vVsoSjwql6lD4ourLvcuuqaKLAvKRe0dkPxp91FfxFMODB1XZBZd09Alb
EHUwvLdPt9zTZo1wILiitolXmZSJoNasZLFw/sVlmnjkSra1xIxDhWkrVAOCQ+9l
+kqV3NkoiatlfIcyD7atEt6fRo05161Bv+dS1Sz9mC5G4Gd2BV8JTo+jv19AWQZG
yMAJjLs5mi9rVhYKiyk0UNl7AkWEwKb9Y1DPAjO4UQ+46OMRmbensM+0iirDmxaa
FNGTQJMrGXihmFPS0KoWlWJL9l7dK4RADcF4J2b1UYEKs3nSA6BHn/04TxXBBspo
CkQnWb7X4SwsC4oyFqPAf666AiXM0EfDQTgtVWY71aW7OMgMZPtBNgUXZ/sKAjfR
dLUz+VTxe4KO1FrBsoSsjXk3pKtEQree9mgCGf9v0GZd5ZLwu8iKRB3Qyrl+VaWL
0UlnR+KRr2QLy6ZFguP/khIELjtXSNbOi0iCotI0ta8/eYif1Cmon/h16vE4f0HQ
vj+rY3MGw22Jg+egzdmZ
=lvqK
-----END PGP SIGNATURE-----

--=-tdbjfuO+TpuUFruJcMmH--

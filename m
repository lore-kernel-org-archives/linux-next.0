From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the slave-dma
 tree
Date: Tue, 27 Nov 2012 15:44:30 +1100
Message-ID: <20121127154430.36e87542081a7cc50f80d0f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__27_Nov_2012_15_44_30_+1100_AZl1=Uga=YzzjNlE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__27_Nov_2012_15_44_30_+1100_AZl1=Uga=YzzjNlE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-spear13xx/spear1310.c between commit b47394911c26 ("ARM:
SPEAr13xx: Pass DW DMAC platform data from DT") from the slave-dma tree
and commit 300a6856324a ("ARM: SPEAr1310: Fix AUXDATA for compact flash
controller") from the arm-soc tree.

I have no idea how to fix this up, so I just effectively dropped the
arm-doc tree patch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__27_Nov_2012_15_44_30_+1100_AZl1=Uga=YzzjNlE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQtEUuAAoJEECxmPOUX5FEkqQQAJZVv6fyRMGLt3Eg7JmvRx8V
3JjnmN5WvnHLRNJnQV1fK3Uyrk40H0qwqudvgu9D3B3zSof+s2JTlvVRJ0dxV2Z5
IaspeK/KFHDJiGzwksv6jjaYrdZmh3k9L9AG7MUg0nb6WVGFKib9I9OKyIQy3P9N
3fTILzxqaqunaJ21gCQabQWCp8MVW1+M4fh8P+JnNccnd8B4fvk+SgyHCRaq1Vjc
RGmIrTL11J/xJ3NGxm6LPupCEJg9dj0W8SVAxwRzpvqUML5vSoEHCOeVqMjzfT5z
54B3GAcYdPQFoE6umVOLdki+u+JA38t+NJauoBSxyhftH/1xHgVVO9rUru2j+s+x
jxVK0M+a1+6439DUQzUycX8w+AKgFsX6jDGNWo7kPkNFVhaBfrNYtcUqZGng2jB0
d2W2kGdqXDP4dgIiWzj2hBIlQuh6ktTqnfbnzi/AcAsCoI6sVgYlN3gfcfhSkSuQ
1PfrTJ3LuLNr4qfkVjZqp8RGuvF+TtpD69DSXo9SUiykm23w05oOtJ6qEqhQq94J
M33MBevN4sXDLviuffwVQUUYL0VQz8IE66n5YiANoGJx5xU8y8CfOdAmgW6duX4S
jBAbq9Phg9TYDYaKWPN/ebK+WF8CrAXU+xPVBbkYbODDQni2SrVWG9mwKPJgF10o
nqqVen+Bg8bgohesN20D
=ETWA
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Nov_2012_15_44_30_+1100_AZl1=Uga=YzzjNlE--

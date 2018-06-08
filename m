From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the thermal tree
Date: Fri, 8 Jun 2018 10:51:20 +1000
Message-ID: <20180608105120.2e232f44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OfKy.SFc+sZS2y_ArD9scpd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OfKy.SFc+sZS2y_ArD9scpd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/thermal/qcom/tsens.c: In function 'tsens_probe':
drivers/thermal/qcom/tsens.c:144:31: error: 's' undeclared (first use in th=
is function)
         num_sensors * sizeof(*s), GFP_KERNEL);
                               ^

Caused by commit

  6d7c70d1cd65 ("thermal: qcom: tsens: Allow number of sensors to come from=
 DT")

interacting with commit

  0ed2dd03b94b ("treewide: Use struct_size() for devm_kmalloc() and friends=
")

from Linus' tree.  It looks like git somehow screwed up the automatic
conflict resolution.

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Jun 2018 10:46:46 +1000
Subject: [PATCH] thermal: gcom: fix up bad git conflict resolution

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/qcom/tsens.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index fb8c87f55240..6164fd36dda3 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -140,8 +140,8 @@ static int tsens_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
=20
-	tmdev =3D devm_kzalloc(dev, sizeof(*tmdev) +
-			     num_sensors * sizeof(*s), GFP_KERNEL);
+	tmdev =3D devm_kzalloc(dev, struct_size(tmdev, sensor, num_sensors),
+			     GFP_KERNEL);
 	if (!tmdev)
 		return -ENOMEM;
=20
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/OfKy.SFc+sZS2y_ArD9scpd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsZ0wgACgkQAVBC80lX
0Gyvtgf/XFkDsz5595Bs/FzL4PZATY+ULoGjE68Fn/WpGqbNzDMY49vut2SNCPdF
gFxjRwUrb7Z0s14HuAh7uq0RUAzzEvW+xVZgnq/gF8UHziol/wYjSCQiwQE+QPw7
dyn9PlUrcgytU0W6GZakeLjoWRMigDfTFkiFSDiPbqHirXBXtZXE5rBWk+QQH8ye
nmADXINOpco+MxNdtn4fWMgc1IdbQD7jaip0tuehQHbB88UI5IihPXISWnSUpl1K
t5xLUEK+/+Q+e4H6HB1ExTj5xJSVUzXJrfKIH63qzHHgFC6oKFpAdQGQcTNglz5o
fEsLnp0T98bgzOjJ23LYgqk5Yr37Tg==
=KzrQ
-----END PGP SIGNATURE-----

--Sig_/OfKy.SFc+sZS2y_ArD9scpd--

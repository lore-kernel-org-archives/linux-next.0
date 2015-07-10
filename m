From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCHv2] regulators: Add missing dummy definition for regulator_list_voltage
Date: Fri, 10 Jul 2015 16:26:38 +0100
Message-ID: <1436541998-19930-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:56329 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751374AbbGJP0m convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Jul 2015 11:26:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, treding@nvidia.com, paul@pwsan.com

=46rom: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

=46ixes a build break when CONFIG_REGULATOR is not selected.

e.g, on linux-next - 07102015:

drivers/clk/tegra/clk-dfll.c: In function =E2=80=98find_lut_index_for_r=
ate=E2=80=99:
drivers/clk/tegra/clk-dfll.c:691:3: error: implicit declaration of func=
tion =E2=80=98regulator_list_voltage=E2=80=99 [-Werror=3Dimplicit-funct=
ion-declaration]
    if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) =3D=3D uv)
    ^
   CC      drivers/clocksource/mmio.o
   CC      fs/proc/softirqs.o
cc1: some warnings being treated as errors
make[3]: *** [drivers/clk/tegra/clk-dfll.o] Error 1
make[2]: *** [drivers/clk/tegra] Error 2
make[1]: *** [drivers/clk] Error 2
make[1]: *** Waiting for unfinished jobs....

This should be pushed to 4.2 as we have the issue in 4.2-rc1, just that
nobody uses it without the REGULATOR(yet).

Cc: Mark Brown <broonie@kernel.org>
Cc: treding@nvidia.com
Cc: paul@pwsan.com
Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
Changes since V1:
 - Return -EINVAL instead of 0
---
 include/linux/regulator/consumer.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulat=
or/consumer.h
index f8a689e..2ba4a40 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -550,6 +550,12 @@ static inline int regulator_count_voltages(struct =
regulator *regulator)
 {
 	return 0;
 }
+
+static inline int regulator_list_voltage(struct regulator *regulator, =
unsigned selector)
+{
+	return -EINVAL;
+}
+
 #endif
=20
 static inline int regulator_set_voltage_tol(struct regulator *regulato=
r,
--=20
1.7.9.5

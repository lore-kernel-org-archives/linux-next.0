From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH] regulators: Add missing dummy definition for regulator_list_voltage
Date: Fri, 26 Jun 2015 12:06:50 +0100
Message-ID: <1435316810-8634-1-git-send-email-suzuki.poulose@arm.com>
References: <558D2FB3.1060209@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:63161 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751680AbbFZLHB (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 07:07:01 -0400
In-Reply-To: <558D2FB3.1060209@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, paul@pwsan.com, treding@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

Fixes a build break when CONFIG_REGULATOR is not selected.

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 include/linux/regulator/consumer.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/c=
onsumer.h
index f8a689e..f7b48eb 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -550,6 +550,12 @@ static inline int regulator_count_voltages(struct regu=
lator *regulator)
 {
 =09return 0;
 }
+
+static inline int regulator_list_voltage(struct regulator *regulator, unsi=
gned selector)
+{
+=09return 0;
+}
+
 #endif
=20
 static inline int regulator_set_voltage_tol(struct regulator *regulator,
--=20
1.7.9.5

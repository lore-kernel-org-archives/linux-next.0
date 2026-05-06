Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F87344D92;
	Wed,  6 May 2026 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061732; cv=none; b=egfquzGkXjvv2rFA7j1cw7D+ouEDtP5x9KwgRl9DYrHbalhR645MWwVFMcjNLeFMsKkioQYt0O/N2BhdWoBbeUf8KssF+PVBwyg7cax3mrobbWDMH+tma6VNZHkXT1ZMeeIZh6ALEXccgrgwGYr5tqxYjapkEJuiH4zywn1XNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061732; c=relaxed/simple;
	bh=KAyEgJ9AXVLnPGkYdJzheSNXoOS+fcIUcUxl/TD8dbo=;
	h=Date:Message-ID:From:To:Cc:Cc:Cc:Cc:Subject; b=XaCUsh/mlcONjydhnz6iTeDtlQ8GlKB73UpFdr45gxbx5bVQEj/FyvhWpIGupuTLpmA12ZqTsot6gMjl21nJv2llp98UNsoYkb04B/1vYcMCEHOmW89U+8mN1+O56spNsknU16GwU0qtcvNKffU1M7cq3dFgeGxlFiyJrIiqRPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jawmULiR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jawmULiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0E7C2BCB8;
	Wed,  6 May 2026 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061731;
	bh=KAyEgJ9AXVLnPGkYdJzheSNXoOS+fcIUcUxl/TD8dbo=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Subject:From;
	b=jawmULiR7F+vg+6R5xj4ThMkE9j5E8FXthqexrirrBOzmCEFZoWrDbnkgcp+t3lZ5
	 o6N6n6Mb/psyUTOC1NEb9KQbLYh2PlyN1LAEmRSoTy/rrzLp6PZvfdqowHE1uR1bJz
	 posR2/xBc4DVN/TK8FQauEklgLz/cfWopAeZULVv7KAmk4HiBh7X3c7AZUR39Sduki
	 JKPmoCGj6p+L+naspTaJyJxiX8movlk/VRkM0NlN0bwGb7lOdDHEMnlHw58TQCzpSS
	 d911JlfwHYck7RPbrRYq83UAwNQh4HajGY07DhtPT1ZkP8YfGyhT2G8y+y24AcEifM
	 TusbG6HLtwuHw==
Date: Wed, 06 May 2026 12:02:09 +0200
Message-ID: <bdb98d48984f53087669d761f771f72e@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Peter Chen <peter.chen@cixtech.com>
Subject: linux-next: manual merge of the pinctrl tree with the pinctrl tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  2fd3902c91c8 ("pinctrl: qcom: Make important drivers default")

from the pinctrl tree and commit:

  517d8fc52f3c ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/configs/defconfig
index dd1ac01ee29b,dde8b61338e3..f4dfd0cc853c
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -652,54 -651,7 +652,8 @@@ CONFIG_PINCTRL_IMX8ULP=
  CONFIG_PINCTRL_IMX91=y
  CONFIG_PINCTRL_IMX93=y
  CONFIG_PINCTRL_IMX_SCMI=y
- CONFIG_PINCTRL_MSM=y
- CONFIG_PINCTRL_ELIZA=y
- CONFIG_PINCTRL_GLYMUR=y
- CONFIG_PINCTRL_IPQ5018=y
- CONFIG_PINCTRL_IPQ5210=y
- CONFIG_PINCTRL_IPQ5332=y
- CONFIG_PINCTRL_IPQ5424=y
- CONFIG_PINCTRL_IPQ8074=y
- CONFIG_PINCTRL_IPQ6018=y
- CONFIG_PINCTRL_IPQ9574=y
- CONFIG_PINCTRL_KAANAPALI=y
- CONFIG_PINCTRL_MSM8916=y
- CONFIG_PINCTRL_MSM8953=y
- CONFIG_PINCTRL_MSM8976=y
- CONFIG_PINCTRL_MSM8994=y
- CONFIG_PINCTRL_MSM8996=y
- CONFIG_PINCTRL_MSM8998=y
- CONFIG_PINCTRL_QCM2290=y
- CONFIG_PINCTRL_QCS404=y
- CONFIG_PINCTRL_QCS615=y
- CONFIG_PINCTRL_QCS8300=y
- CONFIG_PINCTRL_QDF2XXX=y
- CONFIG_PINCTRL_QDU1000=y
  CONFIG_PINCTRL_RP1=m
- CONFIG_PINCTRL_SA8775P=y
- CONFIG_PINCTRL_SC7180=y
- CONFIG_PINCTRL_SC7280=y
- CONFIG_PINCTRL_SC8180X=y
- CONFIG_PINCTRL_SC8280XP=y
- CONFIG_PINCTRL_SDM660=y
- CONFIG_PINCTRL_SDM670=y
- CONFIG_PINCTRL_SDM845=y
- CONFIG_PINCTRL_SDX75=y
 +CONFIG_PINCTRL_SKY1=y
- CONFIG_PINCTRL_SM4450=y
- CONFIG_PINCTRL_SM6115=y
- CONFIG_PINCTRL_SM6125=y
- CONFIG_PINCTRL_SM6350=y
- CONFIG_PINCTRL_SM6375=y
- CONFIG_PINCTRL_MILOS=y
- CONFIG_PINCTRL_SM8150=y
- CONFIG_PINCTRL_SM8250=y
- CONFIG_PINCTRL_SM8350=y
- CONFIG_PINCTRL_SM8450=y
- CONFIG_PINCTRL_SM8550=y
- CONFIG_PINCTRL_SM8650=y
- CONFIG_PINCTRL_SM8750=y
- CONFIG_PINCTRL_X1E80100=y
  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
  CONFIG_PINCTRL_LPASS_LPI=m
  CONFIG_PINCTRL_MILOS_LPASS_LPI=m

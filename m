From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: linux-next: manual merge of the phy-next tree with the qcom tree
Date: Thu, 18 Apr 2019 09:35:44 +0200
Message-ID: <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
References: <20190418152954.255015e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418152954.255015e1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>
Cc: Linux Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On 18/04/2019 07:29, Stephen Rothwell wrote:

> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> between commit:
> 
>   369b89366a3d ("dt-bindings: phy-qcom-qmp: Tweak qcom,msm8998-qmp-ufs-phy")
> 
> from the qcom tree and commit:
> 
>   2815588ea64b ("dt-bindings: phy-qcom-qmp: Add qcom,msm8998-qmp-pcie-phy")
> 
> from the phy-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hello Stephen,

The current state of Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
is indeed:

		For "qcom,msm8998-qmp-usb3-phy" must contain
			"phy", "common".
		For "qcom,msm8998-qmp-ufs-phy": must contain:
			"ufsphy".
		For "qcom,msm8998-qmp-pcie-phy" must contain:
			"phy", "common".
		For "qcom,sdm845-qmp-usb3-phy" must contain:
			"phy", "common".


It is not clear to me what I could/should have done differently to avoid
the conflict?

Regards.

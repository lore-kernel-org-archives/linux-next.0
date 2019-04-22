From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: manual merge of the phy-next tree with the qcom tree
Date: Mon, 22 Apr 2019 17:17:40 +0530
Message-ID: <4e8aefdf-d0bb-9dcd-63b1-94de9d4e69d4@ti.com>
References: <20190418152954.255015e1@canb.auug.org.au>
 <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
 <20190419045844.GA3322@hector.attlocal.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190419045844.GA3322@hector.attlocal.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-next.vger.kernel.org



On 19/04/19 10:28 AM, Andy Gross wrote:
> On Thu, Apr 18, 2019 at 09:35:44AM +0200, Marc Gonzalez wrote:
>>
>> It is not clear to me what I could/should have done differently to avoid
>> the conflict?
> 
> I dropped the patch for now.  We can deal with this later as it is trivial.
> The best way probably would have been for Kishon to take this patch as well.
> Then he would have fixed it up and no one else would have seen it.  But we'll
> deal with it in a few weeks.  No biggie.

I've included "dt-bindings: phy-qcom-qmp: Tweak qcom,msm8998-qmp-ufs-phy" in
linux-phy tree now.

Thanks
Kishon

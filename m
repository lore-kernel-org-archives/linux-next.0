From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: linux-next: manual merge of the phy-next tree with the qcom tree
Date: Tue, 23 Apr 2019 11:13:59 +0200
Message-ID: <264f2d81-ac96-4c57-f440-5561e72ba125@free.fr>
References: <20190418152954.255015e1@canb.auug.org.au>
 <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
 <20190419045844.GA3322@hector.attlocal.net>
 <4e8aefdf-d0bb-9dcd-63b1-94de9d4e69d4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e8aefdf-d0bb-9dcd-63b1-94de9d4e69d4@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On 22/04/2019 13:47, Kishon Vijay Abraham I wrote:

> On 19/04/19 10:28 AM, Andy Gross wrote:
> 
>> On Thu, Apr 18, 2019 at 09:35:44AM +0200, Marc Gonzalez wrote:
>>>
>>> It is not clear to me what I could/should have done differently to avoid
>>> the conflict?
>>
>> I dropped the patch for now.  We can deal with this later as it is trivial.
>> The best way probably would have been for Kishon to take this patch as well.
>> Then he would have fixed it up and no one else would have seen it.  But we'll
>> deal with it in a few weeks.  No biggie.
> 
> I've included "dt-bindings: phy-qcom-qmp: Tweak qcom,msm8998-qmp-ufs-phy" in
> linux-phy tree now.

Thanks Kishon,

Great news. That's one less patch to keep track of.

Regards.

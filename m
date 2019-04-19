From: Andy Gross <agross@kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the qcom tree
Date: Thu, 18 Apr 2019 23:58:44 -0500
Message-ID: <20190419045844.GA3322@hector.attlocal.net>
References: <20190418152954.255015e1@canb.auug.org.au>
 <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d194fa50-8bff-544e-eb88-128810f525f9@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Kishon Vijay Abraham I <kishon@ti.com>, Linux Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 18, 2019 at 09:35:44AM +0200, Marc Gonzalez wrote:
> 
> It is not clear to me what I could/should have done differently to avoid
> the conflict?

I dropped the patch for now.  We can deal with this later as it is trivial.
The best way probably would have been for Kishon to take this patch as well.
Then he would have fixed it up and no one else would have seen it.  But we'll
deal with it in a few weeks.  No biggie.


Andy

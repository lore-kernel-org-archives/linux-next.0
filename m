From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Sat, 18 Oct 2008 15:41:00 -0700
Message-ID: <200810181541.00638.jbarnes@virtuousgeek.org>
References: <20081016144105.fd0f5d5b.sfr@canb.auug.org.au> <200810152123.55165.jbarnes@virtuousgeek.org> <1224131300.8157.536.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-22.bluehost.com ([69.89.21.17]:34299 "HELO
	outbound-mail-22.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1750933AbYJRWlF (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 18 Oct 2008 18:41:05 -0400
In-Reply-To: <1224131300.8157.536.camel@pasglop>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wednesday, October 15, 2008 9:28 pm Benjamin Herrenschmidt wrote:
> > Hm, I must have applied the wrong ones... but I didn't do a ppc build to
> > test. I'll fix it up.
>
> Thanks. So apply 1/2 from my orginal post and v3 of 2/2 that I sent
> yesterday. Let me know if you want me to just resend both.

No I've got them.  I must have accidentally dropped the 1/2 when I rebased 
last time, so d965c04f27d4df28b1ce77b0aea6329c07a8e13d is an orphan (btw 
Stephen how did you find it?).

Just test building & booting now, then I'll send Linus the pull request.

Thanks,
-- 
Jesse Barnes, Intel Open Source Technology Center

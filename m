From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: unsigned commit ...
Date: Thu, 02 Dec 2010 14:38:16 -0800
Message-ID: <4CF81FD8.3080208@schaufler-ca.com>
References: <20101203092928.367d45c0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp110.prem.mail.sp1.yahoo.com ([98.136.44.55]:21887 "HELO
	smtp110.prem.mail.sp1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752892Ab0LBWp1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Dec 2010 17:45:27 -0500
In-Reply-To: <20101203092928.367d45c0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>


The problem was in my converting to a git based submission
process, not with the level of review, although I can see how
the two would be indistinguishable. Thank you for the follow-up.


On 12/2/2010 2:29 PM, Stephen Rothwell wrote:
> Hi James,
>
> Commit 676dac4b1bee0469d6932f698aeb77e8489f5861 ("This patch adds a new
> security attribute to Smack called") that was added to your tree today
> has no Signed-off-by and could do with a better summary line in the
> commit message.  And probably a better explanation of what it does.
>
> Makes me wonder about the level of review it received :-(
>

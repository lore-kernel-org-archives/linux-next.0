From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unsigned commit in the ipmi tree
Date: Thu, 18 May 2017 08:17:42 +1000
Message-ID: <20170518081742.1e00b117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corey Minyard <cminyard@mvista.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Corey,

I noticed a commit with no Signed-off-by from you (as the committer)
in the ipmi tree today:

a40b8d591d4c ipmi_ssif: remove redundant null check on array client->adapter->name

Please fix it up.

-- 
Cheers,
Stephen Rothwell

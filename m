From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 3 Aug 2017 19:27:37 +1000
Message-ID: <20170803192737.0951750e@canb.auug.org.au>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
        <1501748223.29303.369.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751258AbdHCJ1k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Aug 2017 05:27:40 -0400
In-Reply-To: <1501748223.29303.369.camel@linux.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Dan Carpenter <dan.carpenter@oracle.com>

Hi Andy,

On Thu, 03 Aug 2017 11:17:03 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> I just checked what we have in our for-next branch and mentioned commits
> have mine SoB. Should they have something else?

In Darren's response it became clear that even though you had initially
commited the patches, he had rebased them so he is now the committer.
So he should have added a Signed-off-by tag.


-- 
Cheers,
Stephen Rothwell

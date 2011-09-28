From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Wed, 28 Sep 2011 09:42:18 -0400
Message-ID: <4E83243A.7060408@windriver.com>
References: <20110928184150.0fcf097b7f9128f8639059f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110928184150.0fcf097b7f9128f8639059f3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 11-09-28 04:41 AM, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) went on producing more failures (beyond those reported
> earlier).  I have used the version of the moduleh tree from next-20110927
> for today and will see if I have more stamina tomorrow.

I will grab a copy of today's next and pick up where you left off, plowing
into the new additions in next that are implicitly using module.h

Thanks again for doing more than I could have asked.
Paul.

> 

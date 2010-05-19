From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: [PATCH 02/17] kdb: update gfp/slab.h includes
Date: Wed, 19 May 2010 10:50:39 -0500
Message-ID: <4BF408CF.5020209@windriver.com>
References: <1269885165-18617-1-git-send-email-tj@kernel.org><1269885165-18617-3-git-send-email-tj@kernel.org> <20100520013340.1fcc2c0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100520013340.1fcc2c0d.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On 05/19/2010 10:33 AM, Stephen Rothwell wrote:
> Hi Jason,
>
> On Tue, 30 Mar 2010 02:52:30 +0900 Tejun Heo <tj@kernel.org> wrote:
>   
>> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
>> gfp.h or slab.h is included as necessary.
>>
>> Signed-off-by: Tejun Heo <tj@kernel.org>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Jason Wessel <jason.wessel@windriver.com>
>>     
>
> Please apply to the kgdb tree (patch reposted below).
>
>   

No problem.

Looks like it got missed earlier, because I have a fixup from you for
the kdb_support.c file.

I folded this into kgdb-next.

Cheers,
Jason.

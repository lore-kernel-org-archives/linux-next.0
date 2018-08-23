From: John Johansen <john.johansen@canonical.com>
Subject: Re: linux-next: build warning after merge of the apparmor tree
Date: Wed, 22 Aug 2018 18:46:03 -0700
Message-ID: <3d41da0d-c638-7a31-c6dd-36efc6bc8d4b@canonical.com>
References: <20180823102012.0c7cbe1c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823102012.0c7cbe1c@canb.auug.org.au>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 08/22/2018 05:20 PM, Stephen Rothwell wrote:
> Hi John,
> 
> After merging the apparmor tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> security/apparmor/policy_unpack.c: In function 'unpack_dfa':
> security/apparmor/policy_unpack.c:426:1: warning: label 'fail' defined but not used [-Wunused-label]
>  fail:
>  ^~~~
> 
> Introduced by commit
> 
>   fb5841091f28 ("apparmor: remove no-op permission check in policy_unpack")
> 
sorry
fixed

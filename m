From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 23 (uml)
Date: Wed, 23 May 2012 08:58:06 -0700
Message-ID: <4FBD090E.5020901@xenotime.net>
References: <20120523170740.ae058d8d5468d471eb948c39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120523170740.ae058d8d5468d471eb948c39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>
List-Id: linux-next.vger.kernel.org

On 05/23/2012 12:07 AM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20120522:



uml defconfig on x86_64:

arch/um/kernel/process.c: In function 'interrupt_end':
arch/um/kernel/process.c:122:14: error: 'struct task_struct' has no member named 'replacement_session_keyring'
arch/um/kernel/process.c:123:4: error: implicit declaration of function 'key_replace_session_keyring'

-- 

~Randy

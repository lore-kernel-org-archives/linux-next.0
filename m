From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for May 2 (objtool bug!)
Date: Wed, 2 May 2018 08:37:53 -0700
Message-ID: <fb41f3ee-705e-4886-3f78-c7f88db5276d@infradead.org>
References: <20180502165939.2375cf6a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502165939.2375cf6a@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 05/01/2018 11:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180501:
> 

on x86_64 randconfig:

  CC      fs/cifs/smbencrypt.o
drivers/char/ipmi/ipmi_ssif.o: warning: objtool: return_hosed_msg()+0x0: infinite recursion (objtool bug!)
drivers/char/ipmi/ipmi_ssif.o: warning: objtool: deliver_recv_msg()+0x0: infinite recursion (objtool bug!)



-- 
~Randy

From: Anna Schumaker <Anna.Schumaker@netapp.com>
Subject: Re: linux-next: bad commits in the nfs tree
Date: Wed, 4 Jun 2014 08:38:57 -0400
Message-ID: <538F1361.6060400@netapp.com>
References: <20140604083411.4296bcd5@canb.auug.org.au> <CAABAsM4hpz_vCK=AbLUzBnVCr3-_5KhJUqif3YP3Yjp+-ojx8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx12.netapp.com ([216.240.18.77]:19463 "EHLO mx12.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752359AbaFDMjE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2014 08:39:04 -0400
In-Reply-To: <CAABAsM4hpz_vCK=AbLUzBnVCr3-_5KhJUqif3YP3Yjp+-ojx8w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/03/2014 06:46 PM, Trond Myklebust wrote:
> On Tue, Jun 3, 2014 at 6:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Trond,
>>
>> I noticed in the nfs tree this morning 2 commits that have been
>> cherry-picked from Linus' tree:
>>
>> cc6d854967ce    Linux 3.15-rc8
>> 2b267bb3a8e5    powerpc: Wire renameat2() syscall
>>
>> These are part of a branch that you merged from Anna Schumaker.  It
>> looks like they may have been included when Anna was trying to rebase
>> the rest of the branch onto v3.15-rc8?
>>
>> Please fix this up before asking Linus to pull your tree.
>>
> 
> Thanks Stephen! We're still ironing out the kinks in a new process for
> the NFS client maintenance, and appreciate your patience.
> 
> Anna, let's avoid the mess that is 3.15-rc8 for now. Please rebase on
> top of commit b5968725f46d (Push the file layout driver into a
> subdirectory) from my nfs-for-next branch and retag the resulting
> branch using the same commit information as earlier.
> I'll pull the new tag once you send the word that all is ready...

Sure.  I'll take care of that right away!

Anna
> 
> Thanks
>    Trond
> 

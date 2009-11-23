From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: Tree for November 23
Date: Mon, 23 Nov 2009 13:19:32 +0000
Message-ID: <20091123131932.GA28687@linux-mips.org>
References: <20091123185232.1423c56b.sfr@canb.auug.org.au> <4B0A8841.8090905@petalogix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757445AbZKWNTe@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B0A8841.8090905@petalogix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@petalogix.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

On Mon, Nov 23, 2009 at 02:04:01PM +0100, Michal Simek wrote:

>> The microblaze tree still has a build failure for which I reverted a
>> commit.
>>
>> The mips tree gained a conflict against the microblaze tree.
>
> It is problem which is caused one my ftrace patch. MIPS ftrace  
> implementation was first that's why I should solve it. It is easy to fix.
> I just need to know where mips/mips-for-linux-next branch is.

Gitweb:  http://www.linux-mips.org/git?p=upstream-sfr.git;a=summary
Git:     git://www.linux-mips.org/pub/scm/upstream-sfr.git

  Ralf 

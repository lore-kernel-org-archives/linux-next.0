From: "Jan Beulich" <jbeulich@novell.com>
Subject: Re: linux-next: Tree for March 8 (BROKEN:
	 arch/x86/kernel/entry_32.S? (Offensive Word Found In Message)
	 Debian's binutils/as?)
Date: Thu, 10 Mar 2011 19:57:52 +0000
Message-ID: <4D792D41020000780006C482@vpn.id2.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: mingo@elte.hu, hjl.tools@gmail.com
Cc: psomas@cslab.ece.ntua.gr, heukelum@fastmail.fm, sedat.dilek@gmail.com, sedat.dilek@googlemail.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, hpa@zytor.com

>>> "H.J. Lu"  03/09/11 8:05 PM >>>
>On Wed, Mar 9, 2011 at 8:02 AM, Ingo Molnar  wrote:
>> I'm not denying that it's buggy code - I'm just asking you to *PLEASE* at minimum
>> acknowledge that surprise flag days that turn a before-benign condition into a fatal
>> build failure suck to everyone else outside your own little universe.
>>
>
>There is no way for assembler to know if a bug in input source code is
>"benign" or
>not. For assembler, a bug in input is a bug in input.  Assembly programmers
>should appreciate this assembler change for helping him/her catch such bugs
>in his/her codes.

I can only support Ingo here, particularly since the bug fixed in gas
is very unlikely to affect functionality of anyone's code - it's rather
that debuggability would have suffered. Clearly, as Ingo says, a
warning would have been enough for the next couple of years (in
my opinion, actually forever for that very reason), or at least a
diagnostic that's an error by default and can be turned into a
warning by the user. After all, it's not like the assembler couldn't
continue past that point (it can simply ignore the bogus directive),
but it ought to be only that condition which should cause an error.

Jan

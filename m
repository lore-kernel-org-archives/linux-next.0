From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree with the mips tree
Date: Tue, 28 Aug 2012 02:16:22 +0930
Message-ID: <87ehmswae9.fsf@rustcorp.com.au>
References: <20120822131130.d669275edf903d9a38a35789@canb.auug.org.au> <CAMuHMdV9VdJ__yWZwzUnM3=XiRo7NWxiJnnoOBgZ9Jg8v0RTNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV9VdJ__yWZwzUnM3=XiRo7NWxiJnnoOBgZ9Jg8v0RTNg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: linux-next.vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:
> Hi Stephen, David,
>
> On Wed, Aug 22, 2012 at 5:11 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Today's linux-next merge of the rr tree got a conflict in
>> arch/mips/kernel/module.c between commit c54de490a2e4 ("MIPS: Module:
>> Deal with malformed HI16/LO16 relocation sequences") from the mips tree
>> and commit 9db0bbe072c8 ("MIPS: Fix module.c build for 32 bit") from the
>> rr tree.
>>
>> Just context changes (I think).  I fixed it up (see below) and can carry
>> the fix as necessary.
>
>> + #endif
>
> At first I thought this merge conflict resolution introduced the bogus #endif:
>
> arch/mips/kernel/module.c:247:2: error: #endif without #if

That was my bad rebase against another patch.

Fixed now, thanks.

Rusty.

From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Sun, 19 Aug 2018 16:21:57 -0700
Message-ID: <CA+55aFw4WcLcFJkoWoE2v--J3s2Hk8JBU92=Zh351FH7xY8zpw@mail.gmail.com>
References: <20180820081323.23a47af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820081323.23a47af3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Aug 19, 2018 at 3:13 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these
> warnings:
>
> fs/cifs/cifssmb.c:605:3: warning: 'strncpy' writing 16 bytes into a region of size 1 overflows the destination [-Wstringop-overflow=]
>    strncpy(pSMB->DialectsArray+count, protocols[i].name, 16);
>
> Presumably caused by my update to gcc 8.2.0.

Yeah. There are some patches to mark some arrays as non-strings to get
rid of these, but we'll see. Maybe we'll just disable the new gcc
warning if it causes more pain than it is worth.

                  Linus

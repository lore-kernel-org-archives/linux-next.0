From: Adam Borowski <kilobyte@angband.pl>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Mon, 20 Aug 2018 03:33:19 +0200
Message-ID: <20180820013319.slygmbleia55evtl@angband.pl>
References: <20180820081323.23a47af3@canb.auug.org.au>
 <CA+55aFw4WcLcFJkoWoE2v--J3s2Hk8JBU92=Zh351FH7xY8zpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+55aFw4WcLcFJkoWoE2v--J3s2Hk8JBU92=Zh351FH7xY8zpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Aug 19, 2018 at 04:21:57PM -0700, Linus Torvalds wrote:
> On Sun, Aug 19, 2018 at 3:13 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc ppc64_defconfig) produced these
> > warnings:
> >
> > fs/cifs/cifssmb.c:605:3: warning: 'strncpy' writing 16 bytes into a region of size 1 overflows the destination [-Wstringop-overflow=]
> >    strncpy(pSMB->DialectsArray+count, protocols[i].name, 16);
> >
> > Presumably caused by my update to gcc 8.2.0.
> 
> Yeah. There are some patches to mark some arrays as non-strings to get
> rid of these, but we'll see. Maybe we'll just disable the new gcc
> warning if it causes more pain than it is worth.

Every single use of strncpy() for a C string is either a bug, inefficiency,
or both.  In this particular case the code:

        count = 0;
        for (i = 0; i < CIFS_NUM_PROT; i++) {
                strncpy(pSMB->DialectsArray+count, protocols[i].name, 16);
                count += strlen(protocols[i].name) + 1;
                /* null at end of source and target buffers anyway */
        }

* pointlessly clears 16 bytes in every iteration
* calculates the string's length twice
* there's no protection against buffer overflow anyway

So what is the strncpy() there for, when an unbounded copy would be just as
good?  For other cases, there's a bunch of better functions: strlcpy(),
snprintf(), even strlen()+memcpy(), etc.

Valid uses of strncpy() do exist (such as SCSI structs), but those deal with
fixed-width fields.  Thus, gcc is right for warning for at least some of
misuse of strncpy() for C strings.  The function wasn't designed for them.

(Skipped analysis why strncpy is always a bad choice for C strings.)


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀ What Would Jesus Do, MUD/MMORPG edition:
⣾⠁⢰⠒⠀⣿⡁ • multiplay with an admin char to benefit your mortal [Mt3:16-17]
⢿⡄⠘⠷⠚⠋⠀ • abuse item cloning bugs [Mt14:17-20, Mt15:34-37]
⠈⠳⣄⠀⠀⠀⠀ • use glitches to walk on water [Mt14:25-26]

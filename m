From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: make mandocs fails with next-20140715
Date: Tue, 15 Jul 2014 15:48:35 -0700
Message-ID: <53C5AFC3.7000908@infradead.org>
References: <CA+r1Zhg9wwv6qUcRMWNBadE=dWFjbb45J+SwRpV7xg8AmgSEpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhg9wwv6qUcRMWNBadE=dWFjbb45J+SwRpV7xg8AmgSEpw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-next.vger.kernel.org

On 07/15/14 14:15, Jim Davis wrote:
> jim@krebstar:~/linux2$ make mandocs
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/docproc
>   DOCPROC Documentation/DocBook/z8530book.xml
>   MAN     Documentation/DocBook/z8530book.9
> Warn: AUTHOR sect.: no personblurb|contrib for Alan Cox
> 
> [... ]
> 
> Note: Writing spans_boundary.9
>   DOCPROC Documentation/DocBook/device-drivers.xml
> docproc: .//kernel/timer.c: No such file or directory
> make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1
> make: *** [mandocs] Error 2

IIRC Thomas has a patch for this.  Thomas, is the patch in your linux-next tree
or branch or leaf?

-- 
~Randy

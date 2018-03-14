From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the asm-generic tree
Date: Wed, 14 Mar 2018 21:32:06 +0100
Message-ID: <CAK8P3a2wMzJx11KQ5W-EkMFf3mTdvGUp9spCQywNwJFyGJcd5g@mail.gmail.com>
References: <20180315072716.7e9a8e25@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315072716.7e9a8e25@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Mar 14, 2018 at 9:27 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Arnd,
>
> Commit
>
>   77b0b77f7812 ("CRIS: Drop support for the CRIS port")
>
> is missing a Signed-off-by from its committer.

Ah, I know what happened there, sorry about that and thanks a lot for
the report.
Uploading the fixed version (also including a number of new Acks) now.

        Arnd

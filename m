From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the gpio tree with the input tree
Date: Fri, 24 Mar 2017 09:49:42 +1100
Message-ID: <20170324094942.2d5936c9@canb.auug.org.au>
References: <20170320150340.6d73c179@canb.auug.org.au>
        <CACRpkdaDUUDkEqYRRp4St=uPs5Z2TRX1XT14+yvsdLiitBaCdg@mail.gmail.com>
        <CAKdAkRS8QsxUVzg8DH67nbSNHu0fy_jWJStLGt-4fcxy34R30w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751467AbdCWWtp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Mar 2017 18:49:45 -0400
In-Reply-To: <CAKdAkRS8QsxUVzg8DH67nbSNHu0fy_jWJStLGt-4fcxy34R30w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>

Hi Dmitry,

On Thu, 23 Mar 2017 09:30:49 -0700 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> I think the fix is trivial and if it does not both Stephen to carry it
> on we'll let the other Linus resolve it in his tree when merging. I
> think he prefers to have cross-tree merges only happen when it is
> needed for development, not simply to resolve conflicts.

I have no problem carrying the merge fix.

-- 
Cheers,
Stephen Rothwell

From: Daniel Micay <danielmicay@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 14 Jun 2017 21:58:42 -0400
Message-ID: <1497491922.1435.1.camel@gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
         <20170615113548.3e4edcf4@canb.auug.org.au>
         <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35417 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbdFOB6o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 21:58:44 -0400
In-Reply-To: <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 2017-06-14 at 18:56 -0700, Kees Cook wrote:
> On Wed, Jun 14, 2017 at 6:35 PM, Stephen Rothwell <sfr@canb.auug.org.a
> u> wrote:
> > Hi all,
> > 
> > On Mon, 5 Jun 2017 17:01:17 +1000 Stephen Rothwell <sfr@canb.auug.or
> > g.au> wrote:
> > > 
> > > After merging the akpm-current tree, today's linux-next build
> > > (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > sound/pcmcia/pdaudiocf/pdaudiocf.o: warning: objtool: .text:
> > > unexpected end of section
> > > arch/x86/ras/mce_amd_inj.o: warning: objtool: inj_readme_read()
> > > falls through to next function extcpu_fops_open()
> > > sound/sound_core.o: warning: objtool:
> > > register_sound_special_device() falls through to next function
> > > register_sound_special()
> 
> Are these related to the fortify patch? I wouldn't expect that...

They're false positive warnings. I think objtool has a list of
__noreturn functions and needs fortify_panic added there. It's just a
warning so it doesn't need to happen immediately.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Subject: linux-next: build failure after merge of the
 sound-current tree
Date: Tue, 13 Jun 2017 15:59:49 +1000
Message-ID: <20170613155949.3c60b48d@canb.auug.org.au>
References: <20170613094945.06fbd573@canb.auug.org.au>
        <s5htw3kxxp3.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5htw3kxxp3.wl-tiwai@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Takashi,

On Tue, 13 Jun 2017 07:29:12 +0200 Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 13 Jun 2017 01:49:45 +0200,
> Stephen Rothwell wrote:
> > 
> > After merging the sound-current tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > sound/synth/emux/emux.c: In function 'snd_emux_new':
> > sound/synth/emux/emux.c:51:5: error: 'struct snd_emux' has no member named 'oss_synth'  
> 
> My bad, some devel branch sneaked in to for-linus branch
> accidentally.  Now it's backed out.
> 
> Something went wrong in my script recently.  I need to tune it again.
> Sorry for inconvenience.

No worries and thanks.
-- 
Cheers,
Stephen Rothwell

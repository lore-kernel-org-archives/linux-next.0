From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
Date: Mon, 9 Jan 2012 03:10:00 +0000
Message-ID: <20120109031000.GB20043@sirena.org.uk>
References: <20120109125531.dbcac0481adb6376fb7e9ca1@canb.auug.org.au>
 <CAF+7xWktUYvz1UqNyYsgAwEeap6UefXz+YE1wrRydrCWiMKAAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF+7xWktUYvz1UqNyYsgAwEeap6UefXz+YE1wrRydrCWiMKAAg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jan 09, 2012 at 11:03:35AM +0800, Axel Lin wrote:
> 2012/1/9 Stephen Rothwell <sfr@canb.auug.org.au>:

> I think this commit should be replaced by [PATCH] ASoC: Fix build
> dependency for SND_AT91_SOC_AFEB9260
> http://mailman.alsa-project.org/pipermail/alsa-devel/2012-January/047861.html

> Should I send a revert patch for commit 739be96ab837? Or you can do it
> by git-revert command directly?

Send an incremental patch to put things into the desired state.

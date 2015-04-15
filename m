From: Dave Airlie <airlied@gmail.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Wed, 15 Apr 2015 13:03:16 +1000
Message-ID: <CAPM=9tx0-_Mi2nog_efasX92+yFvZ-Hf7a8A2GdM6SuhDdswsw@mail.gmail.com>
References: <20150409143309.3a1fac67@canb.auug.org.au>
	<20150409093556.GP6023@sirena.org.uk>
	<20150414094403.30126f2d@canb.auug.org.au>
	<20150414010706.GB29061@sonymobile.com>
	<20150414112241.3dbad71a@canb.auug.org.au>
	<20150414094017.GM6023@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150414094017.GM6023@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hai Li <hali@codeaurora.org>, Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

On 14 April 2015 at 19:40, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Apr 14, 2015 at 11:22:41AM +1000, Stephen Rothwell wrote:
>> On Mon, 13 Apr 2015 18:07:06 -0700 Bjorn Andersson <bjorn.andersson@sonymobile.com> wrote:
>
>> > Your patch looks correct and should preferrably be added to the drm
>> > tree, or the last patch in my series that drops the API wrapper should
>> > be held back until rc1(?)
>
>> It needs to be sent to Linus as a merge fix when the drm tree is merged.
>
> Or the DRM tree could pull my tree I guess - Rob/David, I can make a tag
> specifically for this branch if you like?

I can just backmerge Linus's tree before I send it to him, and stick
this patch on top.

seems like the best answer.

Dave.

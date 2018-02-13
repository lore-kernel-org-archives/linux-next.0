From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
Date: Tue, 13 Feb 2018 19:15:38 +0800
Message-ID: <CAGb2v658XJEsV+9-Cou-oDq3t-7YhOvsQ+EgLn7nMvkeSB8QwQ@mail.gmail.com>
References: <20180213221019.24527c07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180213221019.24527c07@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 13, 2018 at 7:10 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   d7b1e9fa9536 ("ARM: dts: sun[4-7]i: Remove "cooling-{min|max}-level" for CPU nodes")
>
> is missing a Signed-off-by from its committer.

My bad. I rebased one of the sunxi branches to clean up some commit subjects,
and missed a patch when adding my SoBs.

It's all fixed now.

ChenYu

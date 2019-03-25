From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the coresight tree
Date: Mon, 25 Mar 2019 08:53:03 -0600
Message-ID: <CANLsYkz3bmb0+iwaPm9Nc6F=HTa9+_Uukx5hDTi28QSCOHyKWA@mail.gmail.com>
References: <20190324223227.1987c866@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324223227.1987c866@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Good day Stephen,

On Sun, 24 Mar 2019 at 05:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Mathieu,
>
> Commits
>
>   0a3a3dfb0d15 ("perf tools: Add missing case value")
>   0dd14fd06504 ("perf cs-etm: return errcode in cs_etm__process_auxtrace_info()")
>   9b884872f9be ("perf cs-etm: Remove errnoeous ERR_PTR() usage in cs_etm__process_auxtrace_info")
>
> are missing a Signed-off-by from their committer.

Fixed and pushed - thanks for pointing this out.

Mathieu

>
> --
> Cheers,
> Stephen Rothwell

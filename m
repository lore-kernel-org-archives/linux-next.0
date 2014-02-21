From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm-perf tree
Date: Thu, 20 Feb 2014 17:02:47 -0800
Message-ID: <CAOesGMimJxYLor11EQ-Cn9BnZGg60VrOFC8ZqBdC+wNunptm8w@mail.gmail.com>
References: <20140221115857.3ea3d7277d03c5b6b4d26488@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140221115857.3ea3d7277d03c5b6b4d26488@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 20, 2014 at 4:58 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/boot/dts/qcom-msm8960-cdp.dts between commit a1d711938959 ("ARM:
> dts: msm: Add krait-pmu to platforms with Krait CPUs") from the arm-perf
> tree and commit cc60a1a4d47a ("ARM: dts: msm: split out msm8660 and
> msm8960 soc into dts include") from the arm-soc tree.
>
> I fixed it up (probably not the best way ... see below) and can carry the
> fix as necessary (no action is required).

Will, I think we'll be better off taking dts changes through arm-soc,
unless there's a good reason to take them through other trees (such as
the perf tree in this case). Is there, or should we move them over?


-Olof

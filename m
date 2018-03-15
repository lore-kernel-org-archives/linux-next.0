From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Thu, 15 Mar 2018 22:06:29 +0100
Message-ID: <CAK8P3a2-fUi0nnsLVJ6h_UuJCgwoNs2OEroYed2ofLd=FiPG0g@mail.gmail.com>
References: <20180316075629.019b6560@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316075629.019b6560@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Patrice Chotard <patrice.chotard@st.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 15, 2018 at 9:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   9a5f4879cd8d ("ARM: dts: stih4xx: Add missing #sound-dai-cells")
>
> is missing a Signed-off-by from its committer.

Thanks for the report.

What script do you use to find those? I guess I should check for
missing signoffs as well when pulling a branch.

Patrice, I've dropped the merge now, and picked up the one
patch in it directly, with my signoff. This should fix the issue this
time, but please make sure you always sign off patches when
you apply them from the list.

        Arnd

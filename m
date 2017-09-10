From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the openrisc tree
Date: Mon, 11 Sep 2017 07:24:19 +0900
Message-ID: <CAAfxs74MN=hbZfu7yKFjovpJ3SBTQdTPiKkZCK4G1uoxgixG2Q@mail.gmail.com>
References: <20170911081527.2a2948ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170911081527.2a2948ca@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>
List-Id: linux-next.vger.kernel.org

On Mon, Sep 11, 2017 at 7:15 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Stafford,
>
> Commit
>
>   4ecadd4269e0 ("openrisc: add forward declaration for struct vm_area_struct")
>
> is missing a Signed-off-by from its committer.

Sorry about that, I fixed it.  (I need to remember to run 'git am -s ...')

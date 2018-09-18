From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Sep 2018 09:32:30 -0700 (PDT)
Message-ID: <20180918.093230.1954285517367290862.davem@davemloft.net>
References: <236589cd-b55d-1ceb-f236-36f9135f794e@iogearbox.net>
        <DB7PR04MB4252D31B8E79B789CC507D248B1D0@DB7PR04MB4252.eurprd04.prod.outlook.com>
        <5959dad0-dd02-1c3d-2487-13a69f8c507b@iogearbox.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5959dad0-dd02-1c3d-2487-13a69f8c507b@iogearbox.net>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel@iogearbox.net
Cc: vakul.garg@nxp.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, davejwatson@fb.com, doronrk@fb.com
List-Id: linux-next.vger.kernel.org

From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 18 Sep 2018 11:53:17 +0200

> Ok, I think usually tests assert current kernel behavior to make sure any changes
> coming in don't accidentally break expectations from applications as opposed to
> future tests that still need fixing, but I guess I'm fine either way how to resolve
> the conflict; leaving it up to DaveM. Thanks for clarifying!

I'm doing the merge right now and will leave both tests in.

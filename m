From: Chris Zhong <zyw@rock-chips.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Wed, 10 Sep 2014 10:33:16 +0800
Message-ID: <540FB86C.6010900@rock-chips.com>
References: <20140908183350.5a4e357c@canb.auug.org.au> <20140909223952.GL2601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140909223952.GL2601@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


On 09/10/2014 06:39 AM, Mark Brown wrote:
> On Mon, Sep 08, 2014 at 06:33:50PM +1000, Stephen Rothwell wrote:
>
>> drivers/regulator/rk808-regulator.c:312:18: warning: 'struct rk808_board' declared inside parameter list
>>             struct rk808_board *pdata)
> Chris, as previously requested please send me any changes needed to
> update for the changes in the MFD driver.
Yes, I have modified the rk808.h, so rk808-regulator.c lacks some 
structure now.
Please help me review the patch "[PATCH v10 3/3] regulator: RK808: 
Remove pdata from the regulator"
It contains the corresponding changes.

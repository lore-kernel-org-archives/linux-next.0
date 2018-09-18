From: Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 18 Sep 2018 14:08:59 +0200
Message-ID: <c9b60dd3-5e47-bc5f-98ee-99f96a863710@iogearbox.net>
References: <20180918101107.74d8689a@canb.auug.org.au>
 <93982e9d-dc78-6423-bb9b-c5773d98e244@iogearbox.net>
 <DB7PR04MB42522B223D4E04F5DA519A8B8B1D0@DB7PR04MB4252.eurprd04.prod.outlook.com>
 <236589cd-b55d-1ceb-f236-36f9135f794e@iogearbox.net>
 <DB7PR04MB4252D31B8E79B789CC507D248B1D0@DB7PR04MB4252.eurprd04.prod.outlook.com>
 <5959dad0-dd02-1c3d-2487-13a69f8c507b@iogearbox.net>
 <d5eee0d9-c270-3ce7-5fcd-5f94b713dc3b@iogearbox.net>
 <DB7PR04MB425225AD548F3A3040250EF48B1D0@DB7PR04MB4252.eurprd04.prod.outlook.com>
 <20180918214814.4eae366d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180918214814.4eae366d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vakul Garg <vakul.garg@nxp.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "davejwatson@fb.com" <davejwatson@fb.com>, "doronrk@fb.com" <doronrk@fb.com>
List-Id: linux-next.vger.kernel.org

On 09/18/2018 01:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 18 Sep 2018 10:17:03 +0000 Vakul Garg <vakul.garg@nxp.com> wrote:
>>
>> Got it. 
>> Thanks for the guidance.
> 
> So, what should I remove? ;-)

My (very own personal) preference in general would be that we test / assert
the kernel behavior that exists /today/, meaning once we implement support
for multi-record peek we add the corresponding test case along with that
code. Fwiw, this practice would be consistent with the rest of the kernel
selftests development model we have under net (& bpf).

Thanks,
Daniel

From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: linux-next: manual merge of the device-mapper tree with Linus'
 tree
Date: Mon, 05 Oct 2009 17:40:04 +0200
Message-ID: <4ACA1354.1000403@gmail.com>
References: <20091005144102.8c012c56.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753666AbZJEPkv@vger.kernel.org>
In-Reply-To: <20091005144102.8c012c56.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>
List-Id: linux-next.vger.kernel.org

On 10/05/2009 05:41 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the device-mapper tree got a conflict in
> drivers/md/dm-log-userspace-transfer.c between commit
> 18366b05a00349c1606269ba7422bf9b3a357ff2 ("connector/dm: Fixed a
> compilation warning") from Linus' tree and commit
> 584ac98acfc033dfda338641e736b0100fd31909
> ("dm-log-fix-cn_ulog_callback-declaration") from the device-mapper tree.
> 
> The former commit (already in Linus' tree) supersedes the latter, so I
> used the former.

Hmm, great! I sent it month and a half earlier with proper changelog and
meaningful subject. akpm sent it twice with davem in Cc. davem merged
that one instead.

/me demotivated to post such fixes again.

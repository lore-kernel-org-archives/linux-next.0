From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [v2] mwifiex: Fix endianness for event TLV type
 TLV_BTCOEX_WL_SCANTIME
Date: Fri,  8 Jul 2016 13:47:03 +0000 (UTC)
Message-ID: <20160708134703.E88D061154@smtp.codeaurora.org>
References: <1467275483-24091-1-git-send-email-prasunmaiti87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467275483-24091-1-git-send-email-prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The two members min_scan_time and max_scan_time of structure
> "mwifiex_ie_types_btcoex_scan_time" are of two bytes each. The values
> are assigned directtly from firmware without endian conversion handling.
> So, wrong datas will get saved in big-endian systems.
> 
> This patch converts the values into cpu's byte order before assigning them
> into the local members.
> 
> Signed-off-by: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

Thanks, 1 patch applied to wireless-drivers-next.git:

c18b104dd249 mwifiex: Fix endianness for event TLV type TLV_BTCOEX_WL_SCANTIME

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9206939/

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

#include <bits/stdc++.h>
#define int long long
#define FastIO ios::sync_with_stdio(0); cin.tie(0); cout.tie(0);
using namespace std;
int m,n; 
vector<vector<int> > a;
void input(){
    FastIO;
    freopen("bai4.inp","r",stdin);
    freopen("bai4.out","w",stdout);
    cin >> m >> n;
    a.resize(m);
    for(int i=0; i<m; i++) a[i].resize(n);
    for(int i=0; i<m; i++) 
        for(int j=0; j<n; j++) 
            cin >> a[i][j];
}
void sort1(){
    for(int i=0; i<m-1; i++)
        for(int j=i+1; j<m; j++)
            if(a[i][i]>a[j][j]) swap(a[i][i],a[j][j]);
}
void sort2(){
    int x=1,d; vector<int> temp;
    while(x<n-1){
        int j=x,i=0;
        while(j<n && i<m){
            temp.push_back(a[i][j]);
            i++; j++;
        }
        sort(temp.begin(), temp.end());
        j=x,i=0,d=0;
        while(j<n && i<m){
            a[i][j]=temp[d];
            i++; j++; d++;
        }
        temp.clear();
        x++;
    }
}
void sort3(){
    int y=1,d; vector<int> temp;
    while(y<m-1){
        int i=y, j=0;
        while(j<n && i<m){
            temp.push_back(a[i][j]);
            i++; j++;
        }
        sort(temp.begin(), temp.end());
        i=y,j=0,d=0;
        while(j<n && i<m){
            a[i][j]=temp[d];
            i++; j++; d++;
        }
        temp.clear();
        y++;
    }
}
void sol(){
    sort1();
    sort2();
    sort3();
    for(int i=0;i<m;i++){
        for(int j=0;j<n;j++) cout << a[i][j] << ' ';
        cout << '\n';
    }
}
int32_t main(){
    input();
    sol();
}